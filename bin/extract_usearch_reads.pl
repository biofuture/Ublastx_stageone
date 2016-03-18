#!/usr/bin/perl -w
use strict;


die "perl $0 <usearch.aln> <input.fasta> <output.fa>" unless (@ARGV == 3);

my %get;
die "$! " unless open(I,"$ARGV[0]");
while(<I>){
	chomp;
	my @tm = split(/\t/,$_);
	$tm[0] = (split(/\s+/, $tm[0]))[0]; ##to make sure  the consistence we only kept the first onune black 
	if(exists $get{$tm[0]}){
		print "duplicate $tm[0] $tm[1] in blastout6 with maxaccepts 1 in usearch sequencing file contain same name\n";
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
	my @tem = split(/\s+/,$id);  ##first none black block as the target id 
	$id = $tem[0];
	if(exists $get{$id}){
		print T ">$id\n$seq";
		#print "$id\n";
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
