#!/usr/bin/perl -w
use strict;

#Authur: Xiao-Tao Jiang
#Email biofuture.jiang@gmail.com

##Generate input for online part analysis, merge all extracted fasta 
##and update the meta_data file with number of reads for each sample and number of 16S like reads in each sample

die "perl $0 <Indir> <outdir> <meta_data_in> <meta_data_out> <extracted fasta>  <option_c> <coglist>$!\n" unless (@ARGV == 7);

#Indir is the directory including your fastq file
#Outdir is the directory for output of ublastx_v1.1
#meta_data_in is the orignial meta_data file
#meta_data_out is the update meta data file for online ARG analysis
#extracted fasta is the merged extracted potential ARGs reads for online analysis

##option_c is S/U
##coglist is  all_KO30_name.list

#copycorrect is the indicator for whehter perform copy number correction


my %sampleid;
my %metainfo;
my $rlen = 100;

#my $coglis = "../DB/all_KO30_name.list";
my $coglis = $ARGV[6];

die "$!\n" unless open(I,"$ARGV[2]");
die "$!\n" unless open(T,">$ARGV[3]");
die "$!\n" unless open(TT,">$ARGV[4]");

my $h = <I>; chomp($h);
print T "$h\t#ofReads\t#of16Sreads\tCellNumber\n";

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
		if(-e "$opt_o/$sampleid{$ids}_1.16s" && -e "$opt_o/$sampleid{$ids}_2.16s"){
			#my $s1 = `wc -l $opt_o/$sampleid{$ids}_1.16s`;
			#my $s2 = `wc -l $opt_o/$sampleid{$ids}_2.16s`;
			#my $snum1 = (split(/\s+/,$s1))[0];
			#my $snum2 = (split(/\s+/,$s2))[0];
			die "$!\n" unless open(TS1, "$opt_o/$sampleid{$ids}_1.16s");
			die "$!\n" unless open(TS2, "$opt_o/$sampleid{$ids}_2.16s");
			my $snum1 = 0;
			my $snum2 = 0;			
			while(<TS1>){
				chomp;
				my @tem = split /\t/;
				$snum1 += $tem[3];
			}
			close TS1;

			while(<TS2>){
				chomp;
				my @tem = split /\t/;
				$snum2 += $tem[3];
			}
			close TS2;

			my $s16num = $snum1 + $snum2;
			$hash16s{$sampleid{$ids}} = $s16num / 1432; 

		}else{
			die "wrong run\n";
			
		}
	if($ARGV[5] eq "S"){
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
		if($avecopy == 0){
			$avecopy = 2;
		}
		$cellnum{$sampleid{$ids}} = $hash16s{$sampleid{$ids}}  / $avecopy ;	

	
		}else{
		die "wrong\n";
		}

	}elsif($ARGV[5] eq "U"){
##for cell number counting from the USCMGs 
		if(-e "$opt_o/$sampleid{$ids}.uscmg.blastx.txt"){
			my $avgKOcopy = 0;
		
			my %seq2OGs;
			my %seqlen;
			die "$!\n" unless open(OGMAP, "$coglis");
			while(<OGMAP>){
				chomp;
				my @tem = split(/\t/, $_);
				$seq2OGs{$tem[0]} = $tem[1];
				$seqlen{$tem[0]} = $tem[2];
			}
			close OGMAP;

			die "$!\n" unless open(TAB, "$opt_o/$sampleid{$ids}.uscmg.blastx.txt");
			die "$!\n" unless open(KOAVERAGE, ">$opt_o/$sampleid{$ids}.uscmg.ko_averagecov.txt");
			my %seqcov;
			while(<TAB>){
				chomp;
				my @tem = split(/\t/, $_);
				if(exists $seq2OGs{$tem[1]}){
					$seqcov{$tem[1]} += $tem[3];
				}else{
					$seqcov{$tem[1]} = $tem[3];
				}
			}
			close TAB;
			
			my %kocov;
			for my $sid (keys %seqcov){
				if(exists $seq2OGs{$sid}){
					if(exists $kocov{$seq2OGs{$sid}}{$sid}){
						$kocov{$seq2OGs{$sid}}{$sid} += $seqcov{$sid};
					}else{
						$kocov{$seq2OGs{$sid}}{$sid} = $seqcov{$sid};
					}
				}else{
					die "Wrong ID $sid\n";
				}
			}
			my $KOcount = 0;
			for my $koid (keys %kocov){
				my $ave = 0; 
				my $seqnum =0;
				for my $seqid (keys %{$kocov{$koid}}){
					
					my $seqaverage =  $kocov{$koid}{$seqid} / $seqlen{$seqid};
					$ave += $seqaverage;
					$seqnum ++;
				}
				#$ave = $ave/ $seqnum;

				print KOAVERAGE "$koid\t$ave\t$seqnum\n";
				$avgKOcopy += $ave;
				$KOcount ++;
			}
			die "Line 154 $0 Not KO Maping, wrong datasets\n" if($KOcount == 0);				
			$cellnum{$sampleid{$ids}} = $avgKOcopy / $KOcount; ##The aveage coveage of each universal single copy marker genes KO is the estimated cell number 

		}else{
			die "Wrong run, without the merge blastx result\n";
		}	
	}else{
		die "inappropriate parameters for cell number estimation\n";
	}

	##
	##merge pair_end file reads into one with the sample IDs
	if(-e "$opt_o/$sampleid{$ids}.extract_1.fa" && -e "$opt_o/$sampleid{$ids}.extract_2.fa"){
		die "$!" unless open(TEM1, "$opt_o/$sampleid{$ids}.extract_1.fa");
		die "$!" unless open(TEM2, "$opt_o/$sampleid{$ids}.extract_2.fa");

		my $count = 1;
		while(my $ntem = <TEM1>){
			my $stem = <TEM1>;
			my $changename = ">$sampleid{$ids}_$count";
			print TT "$changename\n$stem";
			$count ++;
		}
		close TEM1;
	
		while(my $ntem = <TEM2>){
			my $stem = <TEM2>;
			my $changename = ">$sampleid{$ids}_$count";
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
	print T "$metainfo{$id}\t$hashreads{$sampleid{$id}}\t$hash16s{$sampleid{$id}}\t$cellnum{$sampleid{$id}}\n";
}

__END__
1;
