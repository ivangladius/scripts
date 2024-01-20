


import subprocess

def remove_gnome_keybind(arg1, arg2):

    try:
        subprocess.run(f"gsettings set {arg1} {arg2} \\[\\]", shell=True, text=True)
    except:
        print("failed to delete keybindings")


keys = "1234567890-=~!@#$%^&*()_+qwertyuiop[]QWERTYUIOP{}asdfghjkl;ASDFGHJKL:|<zxcvbnm,./>ZXCVBNM<>?"

# first find all bound keys

for key in keys:
    keybindings = subprocess.check_output(f"(for schema in $(gsettings list-schemas); do gsettings list-recursively $schema; done) | grep \"{key}\"",
                                  shell=True,
                                  text=True).split("\n")
    for keybind in keybindings:
        if keybind is None:
            continue
        args = keybind.split(" ")
        if len(args) >= 2:
            a1, a2 = args[0], args[1]
            remove_gnome_keybind(a1, a2)



