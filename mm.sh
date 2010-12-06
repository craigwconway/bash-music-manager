#!/bin/bash

i=0
ext=mp3
exportFile=library.txt

setExt()
{
 if [ $1 ] # make sure there is a value
 then
 ext=$1
 fi
}

addMusic()
{
 counter=0 # local counter
 if [ $1 ]
 then
 dir=$1
 else
 echo "Enter a directory to search:"
 read dir
 fi
 if [ ! -d $dir ] # validate directory
 then
 echo "$dir is not a valid directory! Press ENTER to try again."
 read pause
 addMusic
 else
 # add music to array
 files=`find $dir -name *.$ext`
 for file in $files
 do
  arr[$i]=$file # add file to array
  i=`echo "$i + 1"|bc`
  counter=`echo "$counter + 1"|bc`
 done
 echo "Added $counter music files. Press ENTER to continue..."
 read pause
 fi
}

showStats()
{
 size=0
 for a in ${arr[*]} # loop and grab file size
 do
 s=`ls -l $a|awk '{print $5}'`
 size=`echo "$size + $s"|bc`
 done
 echo "There are ${#arr[*]} files using `echo "$size / 1000000"|bc` MB in your music collection."
 echo "Press ENTER to continue..."
 read pause
}

export()
{
 echo "$USER's Music Library (`date`)" > $exportFile
 ./doExport ${#arr[*]} ${arr[*]} | sort >> $exportFile
 echo "Music Library exported to `pwd`/$exportFile. Press ENTER to continue..."
 read pause
}

view()
{
 if [ ! -f $exportFile ]
 then
 echo "No Library Found. Has the library been exported?"
 else
 more $exportFile
 fi
 echo "Press ENTER to continue..."
 read pause
}

while getopts a:e: opt
do
 case $opt in
 a) addMusic $OPTARG;;
 e) setExt $OPTARG;;
 esac
done

menu()
{
 cat << EOF
 Music Manager Main Menu
  a) Add Music (Current: ${#arr[*]} files)
  e) Change Extension (Current: $ext)
  s) Show Library Statistics
  x) Export Library
  v) View Library
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
 v) view;;
 q) exit 0;;
 *) echo "Invalid Choise. Pless Enter to continue..."
    read invalid;;
 esac
done