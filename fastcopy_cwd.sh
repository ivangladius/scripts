
#!/usr/bin/bash

if [ $# -ne 1 ];then
	echo "usage: fcc <item_to_copy>"
else
	cp $1 $(find . -type d | fzf)
fi
