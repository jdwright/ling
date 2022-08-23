#!/usr/bin/perl

while(<>){
  @a = split;
  $n = $a[0];
  $n =~ s/\.sph//;
  open F, ">x$n.m";
  print F "function x$n()
y = opensph('sph2/$a[0]');
y = y($a[1]:$a[2]);
sp = sgram(y,.005,.001,1024,30,3000);
figure(3)
imagesc(sp)
sp = sgram(y,.005,.001,1024,30,1500);
figure(1)
imagesc(sp)
c = sp_max(sp,10,10);
figure(2)
x = search(c,1,5) + 1;
[r,c] = size(sp);
y = (r-x)/512*8000;
";
close F;
}

