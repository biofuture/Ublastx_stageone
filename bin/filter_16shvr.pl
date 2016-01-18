#!/usr/bin/perl -w
use strict;

use Getopt::Std;


our ($opt_a, $opt_b, $opt_c, $opt_d, $opt_o, $opt_h)="";
my  $usage = <<USE;
        Author: JIANG Xiaotao
        Date: 03-01-2016
 
        Email: biofuture.jiang\@gmail.com
        $0 -a <us.s1> -b <us.s2> -c <f1> -d <f2> -o <output.fasta> 

        -a usearch us1
	-b usearch us2
	-c fasta1
	-d fasta2
	-o output.fasta
	-h pritn this information
USE

getopts('a:b:c:d:o:h');

if($opt_h  ||  ($opt_a eq "") ){
        die "$usage\n";
}


die "$!\n" unless open(T, ">$opt_o");
die "$!\n" unless open(C, "$opt_c");
die "$!\n" unless open(D, "$opt_d");

my %f1hash;
my %f2hash;

die "$!\n" unless open(A, "$opt_a");
die "$!\n" unless open(B, "$opt_b");


while(<A>){
	chomp;
	my @tem = split(/\t/);
	$tem[0] = (split(/\s+/, $tem[0]))[0];
	$f1hash{$tem[0]}{$tem[1]} = $tem[3];
}
close A;

while(<B>){
	chomp;
	my @tem = split(/\t/);
	$tem[0] = (split(/\s+/, $tem[0]))[0];
	$f2hash{$tem[0]}{$tem[1]} = $tem[3];
}
close B;

while(my $n = <C>){
	my $s = <C>;
	$n =~ s/^>//;
	$n = (split(/\s+/, $n))[0];
	if(exists $f1hash{$n}){
		#print T ">$n\_$f1hash{$n}\n$s";
		my @tem = ();
		for my $k1 (keys %{$f1hash{$n}}){
			my $s1 = join(":", $k1, $f1hash{$n}{$k1});
			push @tem, $s1;
		}
		my $os = join("-", @tem);
		print T ">$n\_$os\n$s";
			

	}
}
close C;

while(my $n = <D>){
	my $s = <D>;
	$n =~ s/^>//;
	$n = (split(/\s+/, $n))[0];
	if(exists $f2hash{$n}){
		#print T ">$n\_$f2hash{$n}\n$s";
		my @tem = ();
		for my $k2 (keys %{$f2hash{$n}}){
			my $s2 = join(":", $k2, $f2hash{$n}{$k2});
			push @tem, $s2;
		}
		my $os = join("-", @tem);
		print T ">$n\_$os\n$s";
	}
}
close D;

__END__
1;
