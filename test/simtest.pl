#!/usr/bin/perl -w
use strict;
use constant BPP=>3;
use Time::HiRes qw(gettimeofday tv_interval);
use Digest::MD5;
use cv;

if(!@ARGV) { die "need arg";}

my %hashmap;
my %hashmapnocursor;
my %hashmapstage;
my $ppm_old;
my $name;
foreach my $in (@ARGV) {
  # print $in . "\n";

  my $ppm = tinycv::read($in) or die $!;
  if (!$ppm_old) { $ppm_old = $ppm; $name = $in;} 

  print $name . ' ' . $in . " Sim: " . $ppm->similarity($ppm_old) . "\n";

  $ppm_old = $ppm;
  $name = $in;
}
