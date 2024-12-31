
#!/usr/bin/bash

if [[ -z "$1" ]];then
    echo "usage ./pwntemp <filename> [<binary-name>]"
    exit 1
fi

FILENAME="<name>"

if [[ ! -z "$2" ]];then
    FILENAME="$2"
fi

FILENAME="./$FILENAME"

echo "from pwn import *

context.terminal = [\"alacritty\", \"-e\"]
context.binary = \"$FILENAME\"

#g = process(\"$FILENAME\")

g = gdb.debug(\"$FILENAME\", \"\"\"

\"\"\")

g.interactive()
" > "$1"

