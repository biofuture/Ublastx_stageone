#!/usr/bin/perl -w
use strict;

#Authur: Xiao-Tao Jiang
#Email biofuture.jiang@gmail.com

##Generate input for online part analysis, merge all extracted fasta 
##and update the meta_data file with number of reads for each sample and number of 16S like reads in each sample

die "perl $0 <Indir> <outdir> <meta_data_in> <meta_data_out> <extracted fasta>  <normal copy>$!\n" unless (@ARGV == 6);

#Indir is the directory including your fastq file
#Outdir is the directory for output of ublastx_v1.1
#meta_data_in is the orignial meta_data file
#meta_data_out is the update meta data file for online ARG analysis
#extracted fasta is the merged extracted potential ARGs reads for online analysis
#copycorrect is the indicator for whehter perform copy number correction


my %sampleid;
my %metainfo;
my $rlen = 100;

die "$!\n" unless open(I,"$ARGV[2]");
die "$!\n" unless open(T,">$ARGV[3]");
die "$!\n" unless open(TT,">$ARGV[4]");

my $h = <I>; chomp($h);
if($ARGV[5] eq "Y"){

	print T "$h\t#ofReads\t#of16S\tCellNumber\n";
}else{
	print T "$h\t#ofReads\t#of16S\n";
}
while(<I>){
	chomp;
	my @tm = split("\t", $_);
	$sampleid{$tm[0]} = $tm[1];
	$metainfo{$tm[0]} = $_;
}
close I;


my $opt_i = $ARGV[0];
my $opt_o = $ARGV[1];
my %hashreads;
my %hash16s;
my %cellnum;

for my $ids (sort {$a <=> $b}  keys %sampleid){

	##for each sample statistic the number of reads and number of 16S reads
	if(-e "$opt_i/$sampleid{$ids}_1.fa" && -e "$opt_i/$sampleid{$ids}_1.fa"){
			my $num1 = `grep ">" $opt_i/$sampleid{$ids}_1.fa -c`;
			my $num2 = `grep ">" $opt_i/$sampleid{$ids}_2.fa -c`;
			my $ns = $num1 + $num2;
			$hashreads{$sampleid{$ids}} = $ns;
	}else{
		die "wrong run\n";
	}
	
	##for 16s
	if($ARGV[5] eq "Y"){
		if(-e "$opt_o/$sampleid{$ids}_1.16s" && -e "$opt_o/$sampleid{$ids}_2.16s"){
			my $s1 = `wc -l $opt_o/$sampleid{$ids}_1.16s`;
			my $s2 = `wc -l $opt_o/$sampleid{$ids}_2.16s`;
			my $snum1 = (split(/\s+/,$s1))[0];
			my $snum2 = (split(/\s+/,$s2))[0];
			my $s16num = $snum1 + $snum2;
			$hash16s{$sampleid{$ids}} = $s16num * $rlen / 1432; 

		}else{
			die "wrong run\n";
		}
	}
	##for cell number counting
	if(-e "$opt_o/$sampleid{$ids}.16s_hvr_normal.copy.txt"){
		die "$!" unless open(TEM, "$opt_o/$sampleid{$ids}.16s_hvr_normal.copy.txt");		
		my $avecopy = 0;
		while(<TEM>){
			chomp;
			my @tt = split("\t", $_);
			$avecopy = $tt[1];
		}			
		close TEM;
		$cellnum{$sampleid{$ids}} = $hash16s{$sampleid{$ids}}  / $avecopy ;	

	
	}else{
		die "wrong\n";
	}


	##
	if(-e "$opt_o/$sampleid{$ids}.extract_1.fa" && -e "$opt_o/$sampleid{$ids}.extract_2.fa"){
		##merge pair_end file reads into one with the sample IDs
		die "$!" unless open(TEM1, "$opt_o/$sampleid{$ids}.extract_1.fa");
		die "$!" unless open(TEM2, "$opt_o/$sampleid{$ids}.extract_2.fa");

		my $count = 1;
		while(my $ntem = <TEM1>){
			$ntem =~ s/^>//; chomp($ntem);
			my $stem = <TEM1>;
			my $changename = ">$sampleid{$ids}_$count\t$ntem";
			print TT "$changename\n$stem";
			$count ++;
		}
		close TEM1;
	
		while(my $ntem = <TEM2>){
			$ntem =~ s/^>//; chomp($ntem);
			my $stem = <TEM2>;
			my $changename = ">$sampleid{$ids}_$count\t$ntem";
			print TT "$changename\n$stem";
			$count ++;
		}
		close TEM2;
		$count = 0;

	}else{
		die "wrong run\n";
	}		

}##process each pair of fastq 

for my $id (sort {$a <=> $b} keys %metainfo){
	##update meta data files 
	if($ARGV[5]){
		print T "$metainfo{$id}\t$hashreads{$sampleid{$id}}\t$hash16s{$sampleid{$id}}\t$cellnum{$sampleid{$id}}\n";
	}else{
		print T "$metainfo{$id}\t$hashreads{$sampleid{$id}}\t$hash16s{$sampleid{$id}}\n";
	}
}

__END__
1;
