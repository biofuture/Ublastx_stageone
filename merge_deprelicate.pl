#!/usr/bin/perl -w
use strict;

die "perl $0 <card.fasta> <ardb.fasta> <merge_dereplicate.fasta>\n" unless (@ARGV == 3);
die "$!\n" unless open(I, "$ARGV[0]");
die "$!\n" unless open(II, "$ARGV[1]");

die "$!\n" unless open(T, ">$ARGV[2]");

my %seqall;
##Process card files read multi-line fasta into hash and then unique
my @tmp = ();
<I>; ##first seq name 
while(<I>){
	if(/^>/){
		my $o = join("", @tmp);
		if(exists $seqall{$o}){
			$seqall{$o} += 1;	
		}else{
			$seqall{$o} = 1;
		}
		@tmp = ();
	}else{
		chomp;
		push @tmp, $_;
	}
	
}
close I;

##Process ardb
<II>;
@tmp = ();
while(<II>){

	if(/^>/){
		my $o = join("", @tmp);
		if(exists $seqall{$o}){
			$seqall{$o} += 1;	
		}else{
			$seqall{$o} = 1;
		}
		@tmp = ();
	}else{
		chomp;
		push @tmp, $_;
	}
}
close II;


##Generate the output uniq ARGs sequences
my $index =1;
for my $s (sort {$seqall{$b} <=> $seqall{$a}} keys %seqall){
	print T  ">seq_$index\tduplicate in db number\t$seqall{$s}\n$s\n";
	$index ++;
}

