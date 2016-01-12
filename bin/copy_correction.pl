#!/usr/bin/perl -w
use strict;

die "perl $0 <community> <copy_writer_db> <adjust_community>\n" unless (@ARGV == 3);

die "$!\n" unless open(I, "$ARGV[0]");
die "$!\n" unless open(II, "$ARGV[1]");
die "$!\n" unless open(T, ">$ARGV[2]");


my %copyn;
<II>;
while(<II>){
	chomp;
	my @tem = split(/\t/, $_);
	$copyn{$tem[0]} = $tem[1];
}
close II;


while(<I>){
	chomp;
	my @ts = split(/\t/, $_);
	if(exists $copyn{$ts[0]}){
		my $acnum = $ts[1] / $copyn{$ts[0]};
		print T "$ts[0]\t$acnum\n"; 
	}else{
		my $acnum = $ts[1] / 2.45;
		print "$ts[0]\n";
		print T "$ts[0]\t$acnum\n";
	}
}
close I;

__END__
1;
