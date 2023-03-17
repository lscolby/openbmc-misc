# dbus2html

dbus2html is a shell script to collect D-Bus information and generate it to static HTML files by running `./dbus2html.sh /tmp/<target dir>` or `./dbus2html.sh /tmp/<target dir> <dbus service>`.

## Example

```bash
$ ./dbus2html.sh /tmp/dbus2html/ xyz.openbmc_project.Dump.Manager
xyz.openbmc_project.Dump.Manager
```

### HTML files generated from xyz.openbmc_project.Dump.Manager
<!DOCTYPE html><html><body>
<details><summary>xyz.openbmc_project.Dump.Manager</summary><pre>
`-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/index.html">/xyz</a>
  `-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/index.html">/xyz/openbmc_project</a>
    `-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/index.html">/xyz/openbmc_project/dump</a>
      |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/index.html">/xyz/openbmc_project/dump/bmc</a>
      | `-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/index.html">/xyz/openbmc_project/dump/bmc/entry</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/1/index.html">/xyz/openbmc_project/dump/bmc/entry/1</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/10/index.html">/xyz/openbmc_project/dump/bmc/entry/10</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/2/index.html">/xyz/openbmc_project/dump/bmc/entry/2</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/3/index.html">/xyz/openbmc_project/dump/bmc/entry/3</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/4/index.html">/xyz/openbmc_project/dump/bmc/entry/4</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/5/index.html">/xyz/openbmc_project/dump/bmc/entry/5</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/6/index.html">/xyz/openbmc_project/dump/bmc/entry/6</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/7/index.html">/xyz/openbmc_project/dump/bmc/entry/7</a>
      |   |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/8/index.html">/xyz/openbmc_project/dump/bmc/entry/8</a>
      |   `-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/bmc/entry/9/index.html">/xyz/openbmc_project/dump/bmc/entry/9</a>
      |-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/faultlog/index.html">/xyz/openbmc_project/dump/faultlog</a>
      `-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/internal/index.html">/xyz/openbmc_project/dump/internal</a>
        `-<a href="https://lscolby.github.io/openbmc-misc/dbus2html/xyz/openbmc_project/dump/internal/manager/index.html">/xyz/openbmc_project/dump/internal/manager</a>
</pre></details>
</body></html>
