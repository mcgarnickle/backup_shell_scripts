srcDir=$1
destDir=$2
run=$3
configs=$4

#copy config files to source first
if [[ $configs == "config" ]]; then
  #sublime text
  sudo rsync -avh ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings "$srcDir"config/sublime-text/ --exclude=.git* | grep -v 'uptodate'
  #squeezebox
  sudo rsync -avh /var/lib/squeezeboxserver/prefs/ "$srcDir"config/squeezebox/ --exclude=.git* | grep -v 'uptodate'
  #firefox
  sudo rsync -avh ~/.mozilla/firefox/myprofile/sessionstore.* "$srcDir"config/firefox/sessionstore/ --exclude=.git* | grep -v 'uptodate'
  sudo rsync -avh ~/.mozilla/firefox/myprofile/sessions/ "$srcDir"config/firefox/sessions/ --exclude=.git* | grep -v 'uptodate'
  #gnome file associations
  sudo rsync -avh /etc/gnome/defaults.list "$srcDir"config/file_associations/ --exclude=.git* | grep -v 'uptodate'
  #files bookmarks
  sudo rsync -avh ~/.config/gtk-3.0/bookmarks "$srcDir"config/bookmarks/ --exclude=.git* | grep -v 'uptodate'
  #bash
  sudo rsync -avh ~/.bash* "$srcDir"config/bash/ --exclude=.git* | grep -v 'uptodate'
fi

#backup source in full
sudo rsync -avh "$srcDir" "$destDir" --delete --exclude='*~' --exclude=/lost+found* --exclude=/.Trash* --exclude=/autorun* --exclude=/\$RECYCLE.BIN* --exclude=/RECYCLER* --exclude=/System\ Volume\ Information* --exclude=/wubildr --exclude=/Dropbox | grep -v 'uptodate'