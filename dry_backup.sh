#################
## dry backup  ##
#################

srcDir=$1
destDir=$2

if [[ ! -z $3 ]]; then
  #sublime text
  rsync -navh ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings "$srcDir"config/sublime-text/ --exclude=.git* | grep -v 'uptodate'
  #squeezebox
  rsync -navh /var/lib/squeezeboxserver/prefs/ "$srcDir"config/squeezebox/ --exclude=.git* | grep -v 'uptodate'
  #firefox
  rsync -navh /home/alan/.mozilla/firefox/wmc89qgm.default/sessionstore.* "$srcDir"config/firefox/ --exclude=.git* | grep -v 'uptodate'
  rsync -navh /home/alan/.mozilla/firefox/wmc89qgm.default/sessionbackups/ "$srcDir"config/firefox/sessionbackups/ --exclude=.git* | grep -v 'uptodate'
  rsync -navh /home/alan/.mozilla/firefox/wmc89qgm.default/sessions/ "$srcDir"config/firefox/sessions/ --exclude=.git* | grep -v 'uptodate'
  #gnome file associations
  rsync -navh /etc/gnome/defaults.list "$srcDir"config/file_associations/ --exclude=.git* | grep -v 'uptodate'
  #files bookmarks
  rsync -navh ~/.config/gtk-3.0/bookmarks "$srcDir"config/bookmarks/ --exclude=.git* | grep -v 'uptodate'
  #bash
  rsync -navh ~/.bash* "$srcDir"config/bash/ --exclude=.git* | grep -v 'uptodate'
fi

#backup source in full
rsync -navh "$srcDir" "$destDir" --delete --exclude='*~' --exclude=/lost+found* --exclude=/.Trash* --exclude=/autorun* --exclude=/\$RECYCLE.BIN* --exclude=/RECYCLER* --exclude=/System\ Volume\ Information* --exclude=/wubildr | grep -v 'uptodate'