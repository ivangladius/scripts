
#!/usr/bin/bash

if [[ -z "$1" ]];then
    echo "usage ./pwntemp <filename>"
    exit 1
fi

echo "from pwn import *

context.terminal = [\"alacritty\", \"-e\"]
context.binary = <name>

g = gdb.debug(<name>, \"\"\"

\"\"\")

g.interactive()
" > "$1"

