#!/bin/bash

i=0
ext=mp3

setExt()
{
 echo setExt
 read pause
}

addMusic()
{
 echo addMusic
 read pause
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
  e) Change Extension 
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