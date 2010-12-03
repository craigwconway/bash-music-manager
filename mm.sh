#!/bin/bash

i=0
ext=mp3

setExt()
{
 if [ $1 ] # make sure there is a value
 then
 ext=$1
 fi
}

addMusic()
{
 echo "Enter a directory to search:"
 read dir
 if [ ! -d $dir ] 
 then
 echo "$dir is not a valid directory! Press ENTER to try again."
 read pause
 addMusic
 else
 files=`find $dir -name *.$ext`
 for file in $files
 do
  arr[$i]=$file 
  i=`echo "$i + 1"|bc`
 done
 echo "Added ${#arr[*]} music files. Press ENTER to continue..."
 read pause
 fi
}

showStats()
{
 echo showStats
 read pause
}

export()
{
 echo export
 read pause
}


while getopts e: opt
do
 case $opt in
 e) setExt $OPTARG;;
 esac
done

menu()
{
 cat << EOF
 Music Manager Main Menu
  a) Add Music 
  e) Change Extension (Current: $ext)
  s) Show Library Statistics
  x) Export Library
  q) Quit
EOF
}

while :
do
 clear
 menu
 read selection
 case $selection in
 a) addMusic;;
 e) echo "Enter a music file extension"
    read extension
    setExt $extension;;
 s) showStats;;
 x) export;;
 q) exit 0;;
 *) echo "Invalid Choise. Pless Enter to continue..."
    read invalid;;
 esac
done