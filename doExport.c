#include <stdio.h>
// the input parameter is the array of files in the music library
int main(int argc,char *argv[])
{
 int i;
 for (i=2;i<argc;i++) // file list starts at 2
 {
 printf("%s\n",argv[i]); // print the path to the music file on one line
 }
 return 0;
}