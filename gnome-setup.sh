#!/bin/bash

for i in `seq 1 9`; do
    gsettings set org.gnome.shell.keybindings switch-to-application-$i '[]'
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>$i']"
done

gsettings set org.gnome.desktop.wm.preferences focus-mode 'click'

# disabled sloppy because bug https://bugzilla.gnome.org/show_bug.cgi?id=739718
# gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
