#!/usr/bin/perl -w
use strict;


##This script is to obtain the microbial community from the searched hyper variable sequences


die "perl $0 <hyper.out.fa> <Taxonomy.txt> <community.txt>\n" unless(@ARGV == 3);
die "$!" unless open(I, "$ARGV[0]");
die "$!" unless open(II, "$ARGV[1]");
die "$!" unless open(T, ">$ARGV[2]");

my %id2tax;
while( <II>){
	chomp; 	
	my @tem = split("\t", $_);
	$id2tax{$tem[0]} = $tem[1];
}
close II;

my %community;
while(my $n = <I>){
	my $s = <I>;
	chomp($n);
	my @tem = split(/\_/, $n);
	#print "$tem[1]\n";


	if(exists $id2tax{$tem[1]}){
		$community{$id2tax{$tem[1]}} ++;
	}else{
		$community{$id2tax{$tem[1]}} = 1;
	}
}
close I;

for my $key (sort keys %community){
	print T "$key\t$community{$key}\n";
}
