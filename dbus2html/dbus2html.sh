#!/bin/bash

function usage()
{
    echo 'usage: '"${0}"' /tmp/<target dir> or '"${0}"' /tmp/<target dir> <dbus service>'
    exit 1
}

if [ "$#" -eq 1 ]; then
    if [[ "${1}" == --help ]];then
        usage
    fi
    services=$(busctl --acquired | grep "[.]" | awk '{print $1}')
    if [ -z "$services" ]; then
        exit 1
    fi
elif [ "$#" -eq 2 ]; then
    services="${2}"
else
    usage
fi

if [[ "${1}" != /tmp/* ]]; then
    usage
fi

rootpath="${1}"
rm -rf "${rootpath}"

mkdir -p "${rootpath}"
top="${rootpath}"'/index.html'
placeholder=$(printf "%Xplacegolder%X" ${RANDOM}${RANDOM})
echo '<!DOCTYPE html><html><head><title>Service names on the bus</title></head><body>' >> "${top}"

tmpFile=$(mktemp)
for s in $services; do
    echo "${s}"
    echo -e "<details><summary>${s}</summary><pre>\n$(busctl tree ${s})\n</pre></details>" >> "${top}"
    for o in $(busctl tree "${s}" --list | grep '^/[a-z][a-z]*'); do
        path="${rootpath}${o}"
        mkdir -p "${path}"
        index="${path}"'/index.html'
        interfaces=$(busctl introspect "${s}" "${o}" | grep "^[a-z].*interface" | awk '{print $1}')
        if [ -z "$interfaces" ]; then
            continue
        fi

        tmpPage=$(mktemp)
        busctl introspect "${s}" "${o}" > "${tmpPage}"

        for i in $interfaces; do
            if [[ "${i}" == org.freedesktop.DBus.ObjectManager ]]; then
                cmd="busctl call ${s} ${o} org.freedesktop.DBus.ObjectManager GetManagedObjects --verbose"
                heading='.GetManagedObjects'
            else
                busctl introspect "${s}" "${o}" "${i}" | grep property > /dev/null
                if [ $? -eq 1 ]; then
                    continue
                fi
                cmd="busctl call ${s} ${o} org.freedesktop.DBus.Properties GetAll s ${i} --verbose"
                heading="${i}"
            fi
            sed -i "s/^${heading}\s.*/<\/p><details><summary>&<\/summary>$placeholder\n<\/details><p style=\"margin-left:1em;margin-top:0;margin-bottom:0\">/" "${tmpPage}"
            echo -n -e "<table style=\"margin-left:1em;width:100%\"><td style=\"background-color:LightGray\">$(eval ${cmd})</td></table>" > "${tmpFile}"
            sed -i -e "/${placeholder}/r $tmpFile" -e "s/${placeholder}//" "${tmpPage}"
        done
        sed -i "1s/^/<details><summary><b>${s}<\/b><\/summary><p style=\"margin-left:1em;margin-top:0;margin-bottom:0\">/" "${tmpPage}"
        echo '</p></details>' >> "${tmpPage}"
        mv "${tmpPage}" "${index}"
    done
done
rm -f "${tmpFile}"

echo '</body></html>' >> "${top}"

shopt -s globstar nullglob
for i in "${rootpath}"/*/**/index.html
do
    tmpPage=$(mktemp)
    index=${i#"${rootpath}"}
    uri=${index%/*}
    link='<a href="'${index#*/}'">'"${uri}"'</a>'
    sed -i "s|${uri}$|$link|g" "${top}"
    {
        echo '<!DOCTYPE html><html><head><title>'"${uri}"'</title></head><body><pre>';
        cat "${i}";
        echo '</pre></body></html>'
    } > "${tmpPage}"
    sed -i ':a;N;$!ba;s|<p style="margin-left:1em;margin-top:0;margin-bottom:0">\n|<p style="margin-left:1em;margin-top:0;margin-bottom:0">|g' "${tmpPage}"
    sed -i ':a;N;$!ba;s|</table>\n|</table>|g' "${tmpPage}"
    sed -i ':a;N;$!ba;s|</summary>\n|</summary>|g' "${tmpPage}"
    sed -i ':a;N;$!ba;s|</details>\n|</details>|g' "${tmpPage}"
    mv "${tmpPage}" "${i}"
done

