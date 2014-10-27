srcDir=$1
destDir=$2
run=$3
configs=$4

#copy config files to source first
if [[ $configs == "config" ]]; then
  #sublime text
  sudo rsync -navh ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings "$srcDir"config/sublime-text/ --exclude=.git* | grep -v 'uptodate'
  #squeezebox
  sudo rsync -navh /var/lib/squeezeboxserver/prefs/ "$srcDir"config/squeezebox/ --exclude=.git* | grep -v 'uptodate'
  #firefox
  sudo rsync -navh ~/.mozilla/firefox/myprofile/sessionstore.* "$srcDir"config/firefox/sessionstore/ --exclude=.git* | grep -v 'uptodate'
  sudo rsync -navh ~/.mozilla/firefox/myprofile/sessions/ "$srcDir"config/firefox/sessions/ --exclude=.git* | grep -v 'uptodate'
  #gnome file associations
  sudo rsync -navh /etc/gnome/defaults.list "$srcDir"config/file_associations/ --exclude=.git* | grep -v 'uptodate'
  #files bookmarks
  sudo rsync -navh ~/.config/gtk-3.0/bookmarks "$srcDir"config/bookmarks/ --exclude=.git* | grep -v 'uptodate'
  #bash
  sudo rsync -navh ~/.bash* "$srcDir"config/bash/ --exclude=.git* | grep -v 'uptodate'
fi

#backup source in full
sudo rsync -navh "$srcDir" "$destDir" --delete --exclude='*~' --exclude=/lost+found* --exclude=/.Trash* --exclude=/autorun* --exclude=/\$RECYCLE.BIN* --exclude=/RECYCLER* --exclude=/System\ Volume\ Information* --exclude=/wubildr --exclude=/Dropbox | grep -v 'uptodate'