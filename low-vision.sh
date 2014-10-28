#!/bin/sh

as() {
  user="$1"; shift
  env -u HOME sudo -u "$user" dbus-launch --exit-with-session "$@"
  unset user
}

# High-contrast GTK theme and icons
gsettings set org.gnome.desktop.interface gtk-theme HighContrast
gsettings set org.gnome.desktop.interface icon-theme HighContrast
gsettings set org.gnome.desktop.wm.preferences theme HighContrast

# Large text and cursor
gsettings set com.canonical.Unity.Interface text-scale-factor 1.25
gsettings set com.canonical.Unity.Interface cursor-scale-factor 2
touch ~/.Xresources
sed -i -e '/Xcursor.size:/d' ~/.Xresources
echo Xcursor.size:48 >> ~/.Xresources

# Legacy scrollbars
gsettings set com.canonical.desktop.interface scrollbar-mode normal

# Enhanced desktop zoom
gsettings set org.compiz.ezoom:/org/compiz/profiles/unity/plugins/ezoom/ zoom-in-button "<Shift><Super>Button4"
gsettings set org.compiz.ezoom:/org/compiz/profiles/unity/plugins/ezoom/ zoom-out-button "<Shift><Super>Button5"

# High-contrast Unity greeter
# This looks absolutely awful, don't do this
#as lightdm gsettings set com.canonical.unity-greeter high-contrast true
#as lightdm gsettings set com.canonical.unity-greeter theme-name HighContrast
#as lightdm gsettings set com.canonical.unity-greeter icon-theme-name HighContrast

# Low vision terminal profile
gconftool --load gnome-terminal-low-vision.xml
PROFILE_LIST=/apps/gnome-terminal/global/profile_list
num_profiles=$(gconftool --get-list-size $PROFILE_LIST)
found=false
profile_list=""
for i in $(seq 0 $num_profiles | head -n $num_profiles); do
  profile=$(gconftool --get-list-element $PROFILE_LIST $i)
  if test LowVision = "$profile"; then
    found=true
    break
  fi
  if test -z "$profile_list"; then
    profile_list="[$profile"
  else
    profile_list="$profile_list,$profile"
  fi
done
if ! $found; then
  gconftool --set --type=list --list-type=string $PROFILE_LIST \
            "$profile_list,LowVision]"
fi
gconftool --set --type=string /apps/gnome-terminal/global/default_profile LowVision

echo "You must log out and back in for all changes to take effect."
