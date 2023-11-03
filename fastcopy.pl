
use strict;
use warnings;

my $choice = `ls | fzf`;
print "your choice was $choice";
