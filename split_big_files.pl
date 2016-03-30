#!/usr/bin/perl -w
use strict;

##This script help to split the big fastq files into smaller one so that 32-bit usearch could process the fastq files
##The splitted fastq files are named by Name_index_1.fq and Name_index_2.fq

die "perl $0 <IN_1.fq> <IN_2.fq> <Seq_Numb> <Outdir>\n" unless (@ARGV == 3);
##The default Seq_Numb for splitted fastq is 1000000
my $ARGV[2] =|| 10000000;

my $index  = 1;

die "$!\n" unless open(I, "$ARGV[0]");
die "$!\n" unless open(II, "$ARGV[1]");

my $o1 = $ARGV[0];
my $pr1 = s/\_1\.fq//;
$o1 =~ s/\_1\.fq/\_$index\_1\.fq/;
die "$!" if($o1 eq $ARGV[0]);
my $o2 = $ARGV[1];
$o2 =~ s/\_1\.fq/\_$index\_1\.fq/;
my $pr2 = s/\_2\.fq//;
die "$!" if($o2 eq $ARGV[0]);

$o1 = "$ARGV[3]/$o1";
$o2 = "$ARGV[3]/$o2";
die "$!\n" unless open(T, ">$o1");
die "$!\n" unless open(TT, ">$o2");

my $num = 0;
while(my $f1 = <I>){
	my $f2 = <I>;
	my $f3 = <I>;
	my $f4 = <I>;

	##fastq 2
	my $q1 = <II>;
	my $q2 = <II>;
	my $q3 = <II>;
	my $q4 = <II>;

	if($num > $ARGV[2]){
	
		$num = 0;			
		$index ++;	
		close T; close TT;

		##open new output files
		my $on1 = "$ARGV[3]/$";
		my $on2 = "$ARGV[3]/";
		die "$!\n" unless open(T, ">$on1");
		die "$!\n" unless open(TT, ">$on2");
		

	}else{
		print T "$f1$f2$f3$f4";
		print TT "$q1$q2$q3$q4";
		$num ++;
	}

}
close I;
close II;

close T;
close TT;
