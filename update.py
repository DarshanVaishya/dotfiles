import os


os.system("cp ~/.vimrc .")
os.system("cp ~/.Xresources .")
os.system("cp ~/.bashrc .")

if not os.path.isdir(".config/i3"):
    print("Creating i3 folder");
    os.system("mkdir -p .config/i3");
os.system("cp ~/.config/i3/config .config/i3")

if not os.path.isdir(".config/i3status/config/"):
    print("Creating i3status folder")
    os.system("mkdir -p .config/i3status/config/");
os.system("cp ~/.config/i3status/config/i3status.conf .config/i3status/config/")

if not os.path.isdir(".config/ranger"):
    print("Creating ranger folder")
    os.system("mkdir -p .config/ranger");
os.system("cp ~/.config/ranger/* .config/ranger/")

if not os.path.isdir(".config/i3blocks"):
    print("Creating i3blocks folder")
    os.system("mkdir -p .config/i3blocks");
os.system("cp ~/.config/i3blocks/* .config/i3blocks/")

print("Finished")
