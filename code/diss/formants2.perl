#!/usr/bin/perl

# Program:     formants2.perl
# Written by:  jdwright
# Purpose:     

# convert the contents of formants1/ to formants2/
# converts the text format of a praat formant file to a flat
#   representation: each line has 12 fields:
#   intensity, num formants, and 5 formant-bandwidth pairs

# original converted whole file, then just values within a time selection


# read in the beg and end frames for selections of interest
open IN, 'formant_frames.txt';
while(<IN>){
  @a = split;
  $beg{$a[0]} = $a[1];
  $end{$a[0]} = $a[2] + 1;
}
close IN;

open IN, 'beg_discont.txt';
while(<IN>){
  @a = split;
  $beg{$a[0]} = $a[1];
  push @files, "formants1/$a[0].f";
}
close IN;

# loop over files
#chomp(@files = `ls formants1/*`);
for $in (@files){
  print "$in\n";
  $name = $out = $in;
  $out =~ s/1/2/;
  $name =~ s/.+\///;
  $name =~ s/\.f//;
  open IN, $in;
  open OUT, ">$out";
 
  print OUT "inten,n,f1,b1,f2,b2,f3,b3,f4,b4,f5,b5\n";

  # skip until beg frame
  while(<IN>){
    last if /frame \[$beg{$name}\]/;
  }

  while(<IN>){
    if(/^\s+(?:intensity|nFormants|frequency|bandwidth) = (\S+)/){
      push @line, $1;
    }
    if(/^\s+frame/ && @line){
      push @line, 0 while @line < 12;
      print OUT join(',',@line),"\n";
      @line = ();
    }
    
    # first frame after selection of interest
    last if /frame \[$end{$name}\]/;

  }
  
  # don't need this anymore, as long as there's one frame beyond selection
  #push @line, 0 while @line < 12;
  #print OUT join(',',@line),"\n";
 

  close IN;
  close OUT;
} 
