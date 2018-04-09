#!/usr/bin/perl -w
use strict;

die "perl $0 <indir> <db> <nuc/pro> <evalue> <out1> <out2> <threads> <bindir>\n" unless (@ARGV == 8);

opendir my $dirtmp, "$ARGV[0]" or die "Cannot open directory: $!";
my @files = readdir $dirtmp;
closedir $dirtmp;
my $ublastxdir = $ARGV[7];

for my $ftmp1 (@files){
#	die "$ftmp1\n";
	if($ftmp1 =~ m/\_1.fa$/){
		my $ftmp2 = $ftmp1;
		$ftmp2 =~ s/\_1.fa/\_2.fa/;
		die "not exist the pair\n" unless(-e "$ARGV[0]/$ftmp2");                           
		my $otmp1 = "$ARGV[0]/$ftmp1\_tmp1";
		my $otmp2 = "$ARGV[0]/$ftmp2\_tmp2";
		##process the pair of splitted fa 
		if($ARGV[2] eq "pro"){
			##search SARG database using usearch 
		`$ublastxdir/bin/usearch -ublast $ARGV[0]/$ftmp1 -db $ARGV[1] -evalue $ARGV[3] -accel 0.5 -blast6out $otmp1 -threads $ARGV[6] -maxaccepts 1`;
		`$ublastxdir/bin/usearch -ublast $ARGV[0]/$ftmp2 -db $ARGV[1] -evalue $ARGV[3] -accel 0.5 -blast6out $otmp2 -threads $ARGV[6] -maxaccepts 1`;
		}elsif($ARGV[2] eq "nuc"){
			##do usearch against greengene nr90 database to calculate 16S copies number
		`$ublastxdir/bin/usearch -ublast $ARGV[0]/$ftmp1 -db $ARGV[1] -evalue $ARGV[3] -accel 0.5 -blast6out $otmp1 -threads $ARGV[6] -strand both  -maxaccepts 1`;
		`$ublastxdir/bin/usearch -ublast $ARGV[0]/$ftmp2 -db $ARGV[1] -evalue $ARGV[3] -accel 0.5 -blast6out $otmp2 -threads $ARGV[6] -strand both  -maxaccepts 1`;
		}

	}
}
##merge all 

opendir my $dirupdate, "$ARGV[0]";
my @updatefiles = readdir $dirupdate;
close $dirupdate;

for my $fo1 (@updatefiles){
	if($fo1 =~ m/\_tmp1$/){
		my $fo2 = $fo1;
		$fo2 =~ s/\_1\.fa\_tmp1/\_2\.fa\_tmp2/;
		if(-e "$ARGV[0]/$fo2"){
			##merge all the split results 
			`cat $ARGV[0]/$fo1 >> $ARGV[4]`;
			`cat $ARGV[0]/$fo2 >> $ARGV[5]`;
			
		}else{
			die "Wrong $ARGV[0]/$fo1\n";
		}
	}
}
