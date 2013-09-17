#################
## LIVE BACKUP ##
#################

srcDir=$1
destDir=$2

#local docs
sudo rsync -avh ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings "$srcDir"config/sublime-text-2/ | grep -v 'uptodate'

#backup source in full
sudo rsync -avh "$srcDir" "$destDir" --delete --exclude='*~' --exclude=/lost+found* --exclude=/.Trash* --exclude=/autorun* --exclude=/\$RECYCLE.BIN* --exclude=/RECYCLER* --exclude=/System\ Volume\ Information* --exclude=/wubildr | grep -v 'uptodate'