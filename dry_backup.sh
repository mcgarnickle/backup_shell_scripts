## DRY BACKUP ##

srcDir=$1
destDir=$2

#local docs
sudo rsync -navh ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings "$srcDir"config/sublime-text-2/ | grep -v 'uptodate'

#backup source in full
sudo rsync -navh "$srcDir" "$destDir" --delete --exclude='*~' --exclude=/lost+found* --exclude=/.Trash* --exclude=/autorun* --exclude=/\$RECYCLE.BIN* --exclude=/RECYCLER* --exclude=/System\ Volume\ Information* --exclude=/wubildr | grep -v 'uptodate'

