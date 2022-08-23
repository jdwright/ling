#!/usr/bin/perl

# Program:     create_loadsyls.perl
# Written by:  jdwright
# Purpose:     

#print "function x = loadsyls()\n";

chomp(@a = `ls formants2/*`);
for(@a){
  /m110_([a-z]+)/;
  $syl = "s_$1";
  print "$syl = importdata('/Users/jdwright/diss/$_');\n";
}

#print "end\n";

