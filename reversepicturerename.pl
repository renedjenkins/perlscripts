#! /usr/bin/perl -w
# picture rename
#reversepicturerename.pl - takes 3 arguments, example, if you just enter
#perl ./reversepicturerename.pl
#It will output following:
#number of args < 3, ARGS >0
#Example input: perl ~/perlscripts/reversepicturerename.pl billfeeder 1 "./*"
#Example input: perl ~/perlscripts/reversepicturerename.pl bow 1 "./*"
#Example input: perl ~/perlscripts/reversepicturerename.pl field 1 "./*"
#Example input: perl ~/perlscripts/reversepicturerename.pl freefeeder 1 "./*"
#Example input: perl ~/perlscripts/reversepicturerename.pl hill 1 "./*"
#Exiting...
#
#It expects new prefix name number to start with and list of files to
#operate on.
#
#With give input it will operate on the new file to the oldest renameing with
#given prefix with incrementing number, example if you have 100 files in a
#directory and want to rename with prefix foo it will start with newest and
#rename foo00001.txt - foo00101.txt


if ( @ARGV < 3 ) {
    print "number of args < 3, ARGS >" . scalar @ARGV . "\n";
    print "Example input: perl ~/perlscripts/reversepicturerename.pl billfeeder 1 \"\.\/\*\" \n";
    print "Example input: perl ~/perlscripts/reversepicturerename.pl bow 1 \"\.\/\*\" \n";
    print "Example input: perl ~/perlscripts/reversepicturerename.pl field 1 \"\.\/\*\" \n";
    print "Example input: perl ~/perlscripts/reversepicturerename.pl freefeeder 1 \"\.\/\*\" \n";
    print "Example input: perl ~/perlscripts/reversepicturerename.pl hill 1 \"\.\/\*\" \n";
    print "Exiting...\n";
    exit;
}

$prefixname = shift;
$cnt=shift;
$newfilename = "";
@dirs = `find @ARGV -print`;
chomp @dirs;


if ( (not $prefixname) or ($prefixname eq "") ){
    print "Prefix name is nothing\n";
    print "Exiting...\n";
    exit;
}
print ">>>> prefixname: $prefixname\n";
@reversenames = reverse(@dirs);
foreach $filename(@reversenames){
    if ($filename =~ m/\.jpg/ or $filename =~ m/\.Jpg/ or $filename =~ m/\.JPg/ or $filename =~ m/\.JPG/ or $filename =~ m/\.JpG/ or $filename =~ m/\.jPg/ or $filename =~ m/\.jPG/ or $filename =~ m/\.jpG/ ){

        if ($cnt < 10){
            $newfilename = $prefixname . "0" . "0" . "0" . "0" . $cnt . ".jpg";
        } elsif ($cnt > 9 && $cnt < 100) {
            $newfilename = $prefixname . "0" . "0" . "0". $cnt . ".jpg";
        } elsif ($cnt > 99 && $cnt < 1000)  {
            $newfilename = $prefixname . "0" . "0" . $cnt . ".jpg";
        } elsif ($cnt > 999 && $cnt < 10000)  {
            $newfilename = $prefixname . "0" . $cnt . ".jpg";
        } else {
            print "tooo many pictures\n";
        }

        print "$newfilename\n";
        if (-e $newfilename ) {
            print "File already exists, skipping conversion: $newfilename\n";
        } else {
            print "Sending command-> mv $filename $newfilename\n";
            `mv '$filename' '$newfilename'`;
        }

        $cnt++;
    }   
}
