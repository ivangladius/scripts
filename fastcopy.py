
import os

choice = os.popen("ls | fzf").read()
print(choice, end='')
