#pass directory as first arg

#add later:
#  checkOnly function, checkAndDelete function
#  count files before removing
#remove these too?  .m3u, ._*, __MACOSX, ._.ds_store, .ds_store
#remove files in current dir: ls | grep -P "~$" | xargs -d"\n" rm

cleanDir=$1

function printFiles {
  output=$(find $1 -type f -name $2)
  echo -e "files ending with '"$2"':\n""$output"
  printNewLine
}

function removeFiles {
  #recursively remove files (ignore dirs)
  #arg1: directory, arg2: filename
  find $1 -type f -name $2 -exec rm {} \;
}

function countfIles {
  output=$(find $1 -type f -name $2 | wc -l)
  echo -e "# of files ending with '"$2"': "$output
  printNewLine
}

function printNewLine {
  echo -e "\n"
}

printFiles $cleanDir "*~"
#removeFiles $cleanDir "*~"
countfIles $cleanDir "*~"

printFiles $cleanDir ".DS_Store"
#removeFiles $cleanDir ".DS_Store"
countfIles $cleanDir ".DS_Store"

printFiles $cleanDir "desktop.ini"
#removeFiles $cleanDir "desktop.ini"
countfIles $cleanDir "desktop.ini"

printFiles $cleanDir "thumbs.db"
#removeFiles $cleanDir "thumbs.db"
countfIles $cleanDir "thumbs.db"