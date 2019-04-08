#! /usr/bin/perl -w
#Title Case File Name
use File::Copy;
use File::Remove 'remove';
use MP3::Tag;
use MP3::Info;
print "##### MP3 Tag Viewer #####\n";
@dirs = `find @ARGV -print`;
chomp @dirs;
$recordpooldir="/Users/rjenkins/DigitalDJPool/";
foreach $filepathname(@dirs){
    if ($filepathname =~ m/\.mp3/ or $filepathname =~ m/\.MP3/ or $filepathname =~ m/\.mP3/ or $filepathname =~ m/\.Mp3/){
        # create new MP3-Tag object
        $mp3 = MP3::Tag->new($filepathname);
        $mp3->get_tags();
        $id3v2 = $mp3->{ID3v2} if exists $mp3->{ID3v2};
        if ( defined($id3v2) && $id3v2 ){
            @filenameonly = split(/\//, $filepathname);
            $oldfilename = pop(@filenameonly);
            @newfilename = split(/ - /, $oldfilename);

            $title = $mp3->select_id3v2_frame_by_descr("TIT2");
            @splittitle = split(/ \(/, $title);
            $title = $splittitle[0];
            $albumArtist = $mp3->select_id3v2_frame_by_descr("TPE2");
            $originalpath = $recordpooldir . $filepathname;
            print "Old File Name: $oldfilename\n";
            print "New File Name: $newfilename[1]\n";
            print "Title: $title\n";
            print "Album Artist: $albumArtist\n\n";

            print "moving file:\n$originalpath\nTo:\n";
            $pathartist = $recordpooldir . "$albumArtist/";
            $pathartistsong= $pathartist . "$title/";
            if ( -e "$pathartist" ){
                print "path exists > $pathartist\n";
            } else {
                mkdir("$pathartist", 0755);
            }
            if ( -e "$pathartistsong") {
                print "path exists > $pathartistsong\n";
            } else {
                mkdir("$pathartistsong", 0755);
            }
            $newpath = "$pathartistsong" . "\/$newfilename[1]";
            print "$newpath\n";
            move("$originalpath","$newpath");

        } else {
            print "file: $filepathname >>>>>>>>>>>>NO ID3V2 TAG<<<<<<<<<<<<\n\n";
        }
        $mp3->close();
    } 
}
