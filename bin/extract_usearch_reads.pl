#!/usr/bin/perl -w
use strict;


die "perl $0 <usearch.aln> <input.fasta> <output.fa>" unless (@ARGV == 3);

my %get;
die "$! " unless open(I,"$ARGV[0]");
while(<I>){
	chomp;
	my @tm = split(/\t/,$_);
	if(exists $get{$tm[0]}){
		print "duplicate $tm[0] in blastout6 with maxaccepts 1 in usearch sequencing file contain same name\n";
		$get{$tm[0]} = 1;
	}else{
		$get{$tm[0]} = 1;
	}
}
close I;

die "$!" unless open(II,"$ARGV[1]");
die "$!" unless open(T,">$ARGV[2]");

while(my $id = <II>){
	chomp($id);
	my $seq = <II>;
	$id =~ s/^>//;
	if(exists $get{$id}){
		print T ">$id\n$seq";
		delete($get{$id});
	}else{
		
	}
}
close II;
close T;

#check for non-exist in orignial file
for(keys %get){
	die "$_\t$get{$_}\n";
}
