#!/usr/bin/perl -w

die "perl $0 <Fasta1> <Fasta2> <Unique in F1> <Share between F1 and F2> <Unique in F2>\n" unless (@ARGV == 5);
die "$!" unless open(I,"$ARGV[0]");
die "$!" unless open(II,"$ARGV[1]");
die "$!" unless open(F1F2,">$ARGV[3]");
die "$!" unless open(F1,">$ARGV[2]");
die "$!" unless open(F2,">$ARGV[4]");

my %seq1;
while(my $name=<I>){
	my $seq = <I>;
	chomp($seq);
	#$seq = uc($seq);
	#my @tm = split(//, $seq);
	#$seq = join("", @tm);
	$seq1{$seq}=$name;
}
close I;

while(my $n=<II>){
	my $s = <II>;
	chomp($s); 
	#$s = uc($s);
	#my @tm = split(//, $s);
	#$s = join("", @tm);
	if(exists $seq1{$s}){
		print F1F2 "$n$s\n";
		delete $seq1{$s} ;
	}else{
		print F2 "$n$s\n";
	}	
}
close II;

for my $ks (keys %seq1){
	print F1 "$seq1{$ks}$ks\n";
}
close F1; close F2; close F1F2;
