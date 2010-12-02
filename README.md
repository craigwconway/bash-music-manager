Music Manager Project

Summary

The Music Manager script is a menu driven program which collects and displays information about a users music library. The script searches through directories for music files, and adds them to an internal structure. It can collect the results from multiple searches, and report on the statistics of the music library. A library file can also be generated, and stored on the system for future reference.

The main functions of the Music Manager are as follows:
	1. Add Music to the Library
	2. Modify the file extension used for searching for music
	3. Show statistics about the music collection, like total number of music files, and disc usage
	4. Export the library listing to a file

Development Plan

	Step 1: Create skeleton functions as placeholders for the program functionality
		The functions to create are as follows:
			1. addMusic
			2. setExt
			3. showStats
			4. export
		The skeleton functions simply print the function name, and then pause, so that the user can see the output.
			
	Step 2: Create the Main Menu
		The Main Menu lists the options for calling the script functions. Each menu option refers to one of the skeleton functions defined in Step 1. Additionally, the menu should contain an option for quitting the script. The Main Menu should read as follows:

		Music Manager Main Menu
		a) Add Music 
		e) Change Extension 
		s) Show Library Statistics
		x) Export Library
		q) Quit
   
	Step 3: Create the main loop which displays the Main Menu, captures the user input, and calls the selected menu function.
		The main loop should be an endless loop ("while :") which first clears the screen, then displays the Main Menu to prompt for user input. A case block will match menu options to script functions. When an option is selected, the corresponding function is called. If the "Quit" option is selected, "exit 0" is called to exit the program with no error code. A default case ("*") should also be included to trap bad urser input and display an error message.
		
	Step 4: Create a while loop to look for "getopts" options
		The script will have an option to set the music file extension from the command line. The default file extension is "mp3", but if the user wants to enter the program with the file extension set to wav, he would enter the following command:
		
		musicmgr -e wav
		
		The setExt function should work with both the "OPTARG" and Main Menu method of function calling.
		
	Step 5: Fill in the meat of the functions
		1. addMusic 
			- Prompt the user for a directory to search
			- Validate directory
			- Use "find" to do the file search
			- Add music files to internal array
		2. setExt
			- Prompt the user for a value
			- Pass the user input to the function
			- Check to see if there is an argument passed in ($1)
			- Set the ext variable
		3. showStats
			- Loop through array of music files
			- Use "ls" and "awk" to get the file sizes
			- Use "bc" to get the total size in megabytes
		4. export
			- Pass music file array to C program "doExport"
			- Sort the resulting list
			- Redirect the list output to a file
		5. Quit
			- Use "exit 0" to exit with no error code
			
Test Cases
	
	Use the following test cases to confirm proper functionality of the script.
		1. Add Music, Valid, Music
			- Select "a" for Add Music
			- Enter a valid directory with music files at the prompt
			- Confirm that the script finds the proper number of music files
		2. Add Music, Valid, No Music
			- Select "a" for Add Music
			- Enter a valid directory with no music files at the prompt
			- Confirm that the script finds 0 music files
		3. Add Music, Invalid directory
			- Select "a" for Add Music
			- Enter an invalid directory at the prompt
			- Confirm that the script alerts the error and restarts the Add Music prompt
		4. Set extension from the command line
			- Enter the script with the following option: musicmgr -e wav
			- Confirm that the menu shows the proper file extension
			- Add music and confirm that the proper files are found
		5. Set extension from the Main Menu
			- Note the current extension (default is "mp3")
			- Select "e" to change the extension
			- Enter "ogg"
			- Confirm that the menu shows the updates extension
		6. Stats
			- After adding some music to the library, choose the "s" option to Show Stats
			- Verify that the proper number of music files and the correct size value are displayed
		7. No Stats
			- Enter the script, do not add any music to the library
			- Choose "s" from the main menu
			- Verify that the number of files and file size are both 0
		8. Export
			- After adding some music to the library, choose the "x" option to Export
			- Quit the program and view the exported library
			- Verify that the proper number of music files are displayed and sorted
		9. No Export
			- Enter the script, do not add any music to the library
			- Choose "x" from the main menu
			- Verify that a an empty library file is created

Post-Test Enhancements

After running through the test cases, the following enhancements were made to increase usability:

	1. A local counter was added to the "addMusic" function.
	2. The value of the export file name was made into a variable.
	3. The number of files currently in the library was added to the main menu.
	4. A "View" option was created so that the user does not have to exit the script to view the exported library.
	5. The "a" option was added as an OPTARG, and the "addMusic" function was modified, so that the script can do work immediately after calling it from the command line, like so:		musicmgr -a /home/music
	6. Comments were sprinkled liberally in the code so that future shell programers can enhance and modify this script!
			
			
		