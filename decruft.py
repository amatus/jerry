#!/usr/bin/env python

# Remove Amazon webapp from the launcher
from gi.repository import Gio
settings = Gio.Settings.new('com.canonical.Unity.Launcher')
settings['favorites'] = [x for x in settings['favorites']
                         if x != 'application://ubuntu-amazon-default.desktop']
  
