#################
## dry backup  ##
#################

srcDir=$1
destDir=$2

if [[ ! -z $3 ]]; then
  #sublime text
  sudo rsync -navh ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings "$srcDir"config/sublime-text-2/ | grep -v 'uptodate'
  #squeezebox
  sudo rsync -navh /var/lib/squeezeboxserver/prefs/ "$srcDir"config/squeezebox/ | grep -v 'uptodate'
  #firefox
  sudo rsync -navh /home/alan/.mozilla/firefox/w2xnqmo9.default/sessionstore.* "$srcDir"config/firefox/ | grep -v 'uptodate'
  sudo rsync -navh /home/alan/.mozilla/firefox/w2xnqmo9.default/sessionbackups/ "$srcDir"config/firefox/ | grep -v 'uptodate'
  #gnome file associations
  sudo rsync -navh /etc/gnome/defaults.list "$srcDir"config/file_associations/ | grep -v 'uptodate'
  #files bookmarks
  sudo rsync -navh ~/.config/gtk-3.0/bookmarks "$srcDir"config/bookmarks/ | grep -v 'uptodate'
  #bash
  sudo rsync -navh ~/.bash* "$srcDir"config/bash/ | grep -v 'uptodate'
fi

#backup source in full
sudo rsync -navh "$srcDir" "$destDir" --delete --exclude='*~' --exclude=/lost+found* --exclude=/.Trash* --exclude=/autorun* --exclude=/\$RECYCLE.BIN* --exclude=/RECYCLER* --exclude=/System\ Volume\ Information* --exclude=/wubildr | grep -v 'uptodate'