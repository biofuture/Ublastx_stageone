#Processing fq 1 begain:
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/STAS_1.fq inputfqs/STAS_1.fa
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/STAS_2.fq inputfqs/STAS_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARG.udb -evalue 1e-5 -accel 0.5 -blast6out testout/STAS_1.us -threads 10 -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARG.udb -evalue 1e-5 -accel 0.5 -blast6out testout/STAS_2.us -threads 10 -maxaccepts 1

/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testout/STAS_1.us inputfqs/STAS_1.fa testout/STAS.extract_1.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testout/STAS_2.us inputfqs/STAS_2.fa testout/STAS.extract_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out testout/STAS_1.16s -threads 10 -strand both  -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out testout/STAS_2.16s -threads 10 -strand both  -maxaccepts 1


#Search hyper variable region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testout/STAS.16s_1v6.us -threads 10 -strand both  -maxaccepts 10 -query_cov 0.2 -target_cov 0.5 -id 0.9
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testout/STAS.16s_2v6.us -threads 10 -strand both  -maxaccepts 10 -query_cov 0.2 -target_cov 0.5 -id 0.9

#Cut, filter and merge two fasta files 16S hyper varaible region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/filter_16shvr.pl -a testout/STAS.16s_1v6.us -b testout/STAS.16s_2v6.us -c inputfqs/STAS_1.fa -d inputfqs/STAS_2.fa -o testout/STAS.16s_hyperout.txt

#Obatin the microbial community from the hyper variable data
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/obtain_community.pl testout/STAS.16s_hyperout.txt  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.taxonomy.txt testout/STAS.16s_hvr_community.txt


#Copy number correction
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/copy_correction.pl testout/STAS.16s_hvr_community.txt /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/Copy_db.copyrighter.txt testout/STAS.16s_hvr_normal.copy.txt
#Processing fq 2 begain:
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/SWHAS104_1.fq inputfqs/SWHAS104_1.fa
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/SWHAS104_2.fq inputfqs/SWHAS104_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARG.udb -evalue 1e-5 -accel 0.5 -blast6out testout/SWHAS104_1.us -threads 10 -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARG.udb -evalue 1e-5 -accel 0.5 -blast6out testout/SWHAS104_2.us -threads 10 -maxaccepts 1

/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testout/SWHAS104_1.us inputfqs/SWHAS104_1.fa testout/SWHAS104.extract_1.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testout/SWHAS104_2.us inputfqs/SWHAS104_2.fa testout/SWHAS104.extract_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out testout/SWHAS104_1.16s -threads 10 -strand both  -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out testout/SWHAS104_2.16s -threads 10 -strand both  -maxaccepts 1


#Search hyper variable region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testout/SWHAS104.16s_1v6.us -threads 10 -strand both  -maxaccepts 10 -query_cov 0.2 -target_cov 0.5 -id 0.9
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testout/SWHAS104.16s_2v6.us -threads 10 -strand both  -maxaccepts 10 -query_cov 0.2 -target_cov 0.5 -id 0.9

#Cut, filter and merge two fasta files 16S hyper varaible region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/filter_16shvr.pl -a testout/SWHAS104.16s_1v6.us -b testout/SWHAS104.16s_2v6.us -c inputfqs/SWHAS104_1.fa -d inputfqs/SWHAS104_2.fa -o testout/SWHAS104.16s_hyperout.txt

#Obatin the microbial community from the hyper variable data
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/obtain_community.pl testout/SWHAS104.16s_hyperout.txt  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.taxonomy.txt testout/SWHAS104.16s_hvr_community.txt


#Copy number correction
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/copy_correction.pl testout/SWHAS104.16s_hvr_community.txt /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/Copy_db.copyrighter.txt testout/SWHAS104.16s_hvr_normal.copy.txt
#The script file is testout/ublastx_bash_Wed-Oct-11-20:43:44-2017.sh
