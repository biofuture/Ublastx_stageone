#Processing fq 1 begain:
perl  /home/argsoapv2.5/bin/Fq2fa.pl inputfqs//STAS_1.fq inputfqs//STAS_1.fa
perl  /home/argsoapv2.5/bin/Fq2fa.pl inputfqs//STAS_2.fq inputfqs//STAS_2.fa
/home/argsoapv2.5/bin/diamondv0.9.24 blastx -d /home/argsoapv2.5/DB/SARG.2.2.diamondv0.9.24.dmnd -q inputfqs//STAS_1.fa -o testoutdir//STAS_1.us -e 10 -p 8 -k 1 --id 60 --query-cover 15
/home/argsoapv2.5/bin/diamondv0.9.24 blastx -d /home/argsoapv2.5/DB/SARG.2.2.diamondv0.9.24.dmnd -q inputfqs//STAS_2.fa -o testoutdir//STAS_2.us -e 10 -p 8 -k 1 --id 60 --query-cover 15
/home/argsoapv2.5/bin/bbmap/repair.sh in1=inputfqs//STAS_1.fa in2=inputfqs//STAS_2.fa out1=testoutdir//STAS_fixed_1.fa out2=testoutdir//STAS_fixed_2.fa outs=testoutdir//STAS_singletons.fa repair
/home/argsoapv2.5/bin/minimap2 -ax sr /home/argsoapv2.5/DB/gg85_yinxiaole.fasta.mmi testoutdir//STAS_fixed_1.fa testoutdir//STAS_fixed_2.fa >testoutdir//STAS.sam
/home/argsoapv2.5/bin/extract_usearch_reads.pl testoutdir//STAS_1.us inputfqs//STAS_1.fa testoutdir//STAS.extract_1.fa
/home/argsoapv2.5/bin/extract_usearch_reads.pl testoutdir//STAS_2.us inputfqs//STAS_2.fa testoutdir//STAS.extract_2.fa

#Using Diamond to search USCMGs
/home/argsoapv2.5/bin/diamond blastx -q inputfqs//STAS_1.fa -d /home/argsoapv2.5/DB/KO30_DIAMOND.dmnd -o testoutdir//STAS.uscmg_1.dmd -f tab  -p 8 -e 3  --id 0.45 --max-target-seqs 1
/home/argsoapv2.5/bin/diamond blastx -q inputfqs//STAS_2.fa -d /home/argsoapv2.5/DB/KO30_DIAMOND.dmnd -o testoutdir//STAS.uscmg_2.dmd -f tab  -p 8  -e 3 --id 0.45 --max-target-seqs 1
cat testoutdir//STAS.uscmg_1.dmd testoutdir//STAS.uscmg_2.dmd > testoutdir//STAS.uscmg.blastx.txt
#Processing fq 2 begain:
perl  /home/argsoapv2.5/bin/Fq2fa.pl inputfqs//SWHAS104_1.fq inputfqs//SWHAS104_1.fa
perl  /home/argsoapv2.5/bin/Fq2fa.pl inputfqs//SWHAS104_2.fq inputfqs//SWHAS104_2.fa
/home/argsoapv2.5/bin/diamondv0.9.24 blastx -d /home/argsoapv2.5/DB/SARG.2.2.diamondv0.9.24.dmnd -q inputfqs//SWHAS104_1.fa -o testoutdir//SWHAS104_1.us -e 10 -p 8 -k 1 --id 60 --query-cover 15
/home/argsoapv2.5/bin/diamondv0.9.24 blastx -d /home/argsoapv2.5/DB/SARG.2.2.diamondv0.9.24.dmnd -q inputfqs//SWHAS104_2.fa -o testoutdir//SWHAS104_2.us -e 10 -p 8 -k 1 --id 60 --query-cover 15
/home/argsoapv2.5/bin/bbmap/repair.sh in1=inputfqs//SWHAS104_1.fa in2=inputfqs//SWHAS104_2.fa out1=testoutdir//SWHAS104_fixed_1.fa out2=testoutdir//SWHAS104_fixed_2.fa outs=testoutdir//SWHAS104_singletons.fa repair
/home/argsoapv2.5/bin/minimap2 -ax sr /home/argsoapv2.5/DB/gg85_yinxiaole.fasta.mmi testoutdir//SWHAS104_fixed_1.fa testoutdir//SWHAS104_fixed_2.fa >testoutdir//SWHAS104.sam
/home/argsoapv2.5/bin/extract_usearch_reads.pl testoutdir//SWHAS104_1.us inputfqs//SWHAS104_1.fa testoutdir//SWHAS104.extract_1.fa
/home/argsoapv2.5/bin/extract_usearch_reads.pl testoutdir//SWHAS104_2.us inputfqs//SWHAS104_2.fa testoutdir//SWHAS104.extract_2.fa

#Using Diamond to search USCMGs
/home/argsoapv2.5/bin/diamond blastx -q inputfqs//SWHAS104_1.fa -d /home/argsoapv2.5/DB/KO30_DIAMOND.dmnd -o testoutdir//SWHAS104.uscmg_1.dmd -f tab  -p 8 -e 3  --id 0.45 --max-target-seqs 1
/home/argsoapv2.5/bin/diamond blastx -q inputfqs//SWHAS104_2.fa -d /home/argsoapv2.5/DB/KO30_DIAMOND.dmnd -o testoutdir//SWHAS104.uscmg_2.dmd -f tab  -p 8  -e 3 --id 0.45 --max-target-seqs 1
cat testoutdir//SWHAS104.uscmg_1.dmd testoutdir//SWHAS104.uscmg_2.dmd > testoutdir//SWHAS104.uscmg.blastx.txt
#The script file is testoutdir//ublastx_bash_Thu-Jan-7-09:41:22-2021.sh
/home/argsoapv2.5/bin/merge_extracted_fa_update_metadate.v2.3.pl inputfqs/ testoutdir/ meta-data.txt testoutdir//meta_data_online.txt testoutdir//extracted.fa U /home/argsoapv2.5/DB/all_KO30_name.list
