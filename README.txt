This is a collection of various perlscripts for personal use.

TODO: Create a list of the scripts and their intended use.
===============================================================================
reversepicturerename.pl - takes 3 arguments, example, if you just enter
$ perl ./reversepicturerename.pl
It will output following:
number of args < 3, ARGS >0
Example input: perl ~/perlscripts/reversepicturerename.pl billfeeder 1 "./*" 
Example input: perl ~/perlscripts/reversepicturerename.pl bow 1 "./*" 
Example input: perl ~/perlscripts/reversepicturerename.pl field 1 "./*" 
Example input: perl ~/perlscripts/reversepicturerename.pl freefeeder 1 "./*" 
Example input: perl ~/perlscripts/reversepicturerename.pl hill 1 "./*" 
Exiting...

It expects new prefix name number to start with and list of files to 
operate on.

With give input it will operate on the new file to the oldest renameing with
given prefix with incrementing number, example if you have 100 files in a
directory and want to rename with prefix foo it will start with newest and 
rename foo00001.txt - foo00101.txt


===============================================================================
