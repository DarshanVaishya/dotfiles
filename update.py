import os


os.system("cp ~/.vimrc .")
os.system("cp ~/.Xresources .")
os.system("cp ~/.bashrc .")

if not os.path.isdir("i3"):
    print("Creating i3 folder");
    os.system("mkdir i3");
os.system("cp ~/.config/i3/config i3")

if not os.path.isdir("i3status/config/"):
    print("Creating i3status folder")
    os.system("mkdir -p i3status/config/");
os.system("cp ~/.config/i3status/config/i3status.conf i3status/config/")

if not os.path.isdir("ranger"):
    print("Creating ranger folder")
    os.system("mkdir ranger");
os.system("cp ~/.config/ranger/* ranger/")
