#!/usr/bin/perl

use 5.22.1;
use strict;
use warnings;

use File::Basename;

say "*"x40;
say "Script File Generator by Prasad Pandit *";
say "*"x40;

print "Enter the name of Perl Script you want to create: ";
my $file_name = <STDIN>;
chomp $file_name;

my $ext;

if($file_name =~ /(\.[^.]+)$/)
{
	($ext) = $file_name =~ /(\.[^.]+)$/;
}
else
{
	$ext = 0;
}

if ($ext ne ".pl")
{
	$file_name = $file_name.".pl";
}

print "$file_name File already exists!\n" and exit if -e $file_name;
say "Creating $file_name ..........";
open (my $file_header, '>',$file_name) or die "Failed creating $file_name\n";

my $file_content = qq {#!/usr/bin/perl

use 5.22.1;
use strict;
use warnings;

#****************************************************************
#File $file_name Generated using Script by Prasad Pandit	* 
#****************************************************************

};

print $file_header $file_content;

close $file_header;
say ("Generation of $file_name completed..!!");




