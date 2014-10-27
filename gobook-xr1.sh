#!/bin/sh

# Enable touchscreen
sudo install -m 755 gobook-xr1-touchscreen /etc/init.d/
sudo update-rc.d gobook-xr1-touchscreen defaults

# Calibrate touchscreen
if ! test -e /usr/share/X11/xorg.conf.d/99-calibration.conf; then
  sudo apt-get install -y xinput-calibrator
  xinput_calibrator | sed -n -e '/Section/,/EndSection/p' > 99-calibration.conf
  sudo install -m 644 99-calibration.conf /usr/share/X11/xorg.conf.d/
  rm 99-calibration.conf
fi

# Fix sound
sudo install -m 644 blacklist-gobook-xr1-sound.conf /etc/modprobe.d/
sudo install -m 755 gobook-xr1-sound /etc/init.d/
sudo update-rc.d gobook-xr1-sound defaults
