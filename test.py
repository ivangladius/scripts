
import argparse
import subprocess


def fast_copy_file(file_name):
    find_command = ["find", "/home/max", "-type", "d"]
    fzf_command = ["fzf"]
    cd_command = ["cd"]
    try:
        find_process = subprocess.Popen(find_command, 
                                        check=True,
                                        text=True,
                                        stdout=subprocess.PIPE,
                                        stdin=subprocess.PIPE)
        try:
            subprocess.Popen(fzf_command,
                             check=True, 
                             text=True,
                             stdin=find_process.stdout,
                             stdout=subprocess.PIPE)
        except subprocess.CalledProcessError as e:
            print(e.output)
    except subprocess.CalledProcessError as e:
        print(e.output)
    print("done")

parser = argparse.ArgumentParser()
parser.add_argument('-c', '--copy', action='store')
parser.add_argument('-d', '--dir', action='store_true')
parser.add_argument('-f', '--file', action='store_true')
options = parser.parse_args()
args = options._get_args()

print(options.copy)
print(options.dir)
print(options.file)

if options.copy is not None:
    fast_copy_file("asdf")
if options.dir:
    print("he wants to dir")
if options.file:
    print("he wants to file")
