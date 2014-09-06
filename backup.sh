#################
##LIVE BACKUP!!##
#################

srcDir=$1
destDir=$2

#copy config files to source first
if [[ ! -z $3 ]]; then
  #sublime text
  sudo rsync -avh ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings "$srcDir"config/sublime-text/ --exclude=.git* | grep -v 'uptodate'
  #squeezebox
  sudo rsync -avh /var/lib/squeezeboxserver/prefs/ "$srcDir"config/squeezebox/ --exclude=.git* | grep -v 'uptodate'
  #firefox
  sudo rsync -avh /home/alan/.mozilla/firefox/wmc89qgm.default/sessionstore.* "$srcDir"config/firefox/ --exclude=.git* | grep -v 'uptodate'
  sudo rsync -avh /home/alan/.mozilla/firefox/wmc89qgm.default/sessionbackups/ "$srcDir"config/firefox/ --exclude=.git* | grep -v 'uptodate'
  sudo rsync -avh /home/alan/.mozilla/firefox/wmc89qgm.default/sessions/ "$srcDir"config/firefox/sessions/ --exclude=.git* | grep -v 'uptodate'
  #gnome file associations
  sudo rsync -avh /etc/gnome/defaults.list "$srcDir"config/file_associations/ --exclude=.git* | grep -v 'uptodate'
  #files bookmarks
  sudo rsync -avh ~/.config/gtk-3.0/bookmarks "$srcDir"config/bookmarks/ --exclude=.git* | grep -v 'uptodate'
  #bash
  sudo rsync -avh ~/.bash* "$srcDir"config/bash/ --exclude=.git* | grep -v 'uptodate'
fi

#backup source in full
sudo rsync -avh "$srcDir" "$destDir" --delete --exclude='*~' --exclude=/lost+found* --exclude=/.Trash* --exclude=/autorun* --exclude=/\$RECYCLE.BIN* --exclude=/RECYCLER* --exclude=/System\ Volume\ Information* --exclude=/wubildr | grep -v 'uptodate'