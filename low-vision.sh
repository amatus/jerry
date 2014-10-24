#!/bin/sh

as() {
  user="$1"; shift
  env -u HOME sudo -u "$user" dbus-launch --exit-with-session "$@"
  unset user
}

# High-contrast GTK theme and icons
gsettings set org.gnome.desktop.interface gtk-theme HighContrast
gsettings set org.gnome.desktop.interface icon-theme HighContrast

# High-contrast Unity greeter
# This looks absolutely awful, don't do this
#as lightdm gsettings set com.canonical.unity-greeter high-contrast true
#as lightdm gsettings set com.canonical.unity-greeter theme-name HighContrast
#as lightdm gsettings set com.canonical.unity-greeter icon-theme-name HighContrast

