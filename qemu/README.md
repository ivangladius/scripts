# Quick-n-dirty QEMU script to spin up Debian on various CPU's

This script downloads one of the QEMU images from https://people.debian.org/~aurel32/qemu/ and boots up a vm.

(unfortunately, these are all [wheezy](https://www.debian.org/releases/wheezy/) images,
which is quite old now, but still useful for e.g. compiling a C file or running a binary)

Usage examples:

```
qemu.sh mips
qemu.sh ppc
qemu.sh arm
qemu.sh x86
qemu.sh x64
```

Notes:
- The root account password is **root**
- There is a user account named **user** with password **user**
- Port 22 is port-forwarded to **2222**, try `ssh -p 2222 user@localhost`

Tips:
- The debian packages for wheezy have moved to archive.debian.org.
You can `echo deb http://archive.debian.org/debian wheezy main > /etc/apt/sources.list`,
but be aware that there are no more security updates for wheezy.
- `apt-get remove bash-completion` (too laggy under emulation)

TODO:
- DONE port forward the ssh port
- DONE port this to macOS

