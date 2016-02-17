#!/bin/sh

# This fixes wireshark
# see: http://askubuntu.com/questions/34214/how-do-i-disable-overlay-scrollbars
touch ~/.xprofile
sed -i -e '/LIBOVERLAY_SCROLLBAR/d' ~/.xprofile
echo 'export LIBOVERLAY_SCROLLBAR=0' >> ~/.xprofile

echo "You must log out and back in for all changes to take effect."
