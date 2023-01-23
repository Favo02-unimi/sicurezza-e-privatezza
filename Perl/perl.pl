#!/usr/bin/perl
use warnings;
use strict;

my $filename = '/flag';

open(FH, '<', $filename) or die $!;

while(<FH>){
   print $_;
}

close(FH);