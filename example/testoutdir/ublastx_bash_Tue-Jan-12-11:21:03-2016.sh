#Processing fq 1 begain:
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/STAS_1.fq inputfqs/STAS_1.fa
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/STAS_2.fq inputfqs/STAS_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_1.us -threads 15 -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_2.us -threads 15 -maxaccepts 1

/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testoutdir/STAS_1.us inputfqs/STAS_1.fa testoutdir/STAS.extract_1.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testoutdir/STAS_2.us inputfqs/STAS_2.fa testoutdir/STAS.extract_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_1.16s -threads 15 -strand both  -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_2.16s -threads 15 -strand both  -maxaccepts 1


#Search hyper variable region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS.16s_1v6.us -threads 15 -strand both  -maxaccepts 1 -query_cov 0.2 -target_cov 0.2
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS.16s_2v6.us -threads 15 -strand both  -maxaccepts 1 -query_cov 0.2 -target_cov 0.2

#Cut, filter and merge two fasta files 16S hyper varaible region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/filter_16shvr.pl -a testoutdir/STAS.16s_1v6.us -b testoutdir/STAS.16s_2v6.us -c inputfqs/STAS_1.fa -d inputfqs/STAS_2.fa -o testoutdir/STAS.16s_hyperout.txt

#Obatin the microbial community from the hyper variable data
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/obtain_community.pl testoutdir/STAS.16s_hyperout.txt  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.taxonomy.txt testoutdir/STAS.16s_hvr_community.txt


#Copy number correction
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/copy_correction.pl testoutdir/STAS.16s_hvr_community.txt /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/Copy_db.copyrighter.txt testoutdir/STAS.16s_hvr_community.adjust.txt
#Processing fq 2 begain:
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/SWHAS104_1.fq inputfqs/SWHAS104_1.fa
perl  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/Fq2fa.pl inputfqs/SWHAS104_2.fq inputfqs/SWHAS104_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_1.us -threads 15 -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_2.us -threads 15 -maxaccepts 1

/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testoutdir/SWHAS104_1.us inputfqs/SWHAS104_1.fa testoutdir/SWHAS104.extract_1.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/extract_usearch_reads.pl testoutdir/SWHAS104_2.us inputfqs/SWHAS104_2.fa testoutdir/SWHAS104.extract_2.fa
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_1.16s -threads 15 -strand both  -maxaccepts 1
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_2.16s -threads 15 -strand both  -maxaccepts 1


#Search hyper variable region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104.16s_1v6.us -threads 15 -strand both  -maxaccepts 1 -query_cov 0.2 -target_cov 0.2
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104.16s_2v6.us -threads 15 -strand both  -maxaccepts 1 -query_cov 0.2 -target_cov 0.2

#Cut, filter and merge two fasta files 16S hyper varaible region
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/filter_16shvr.pl -a testoutdir/SWHAS104.16s_1v6.us -b testoutdir/SWHAS104.16s_2v6.us -c inputfqs/SWHAS104_1.fa -d inputfqs/SWHAS104_2.fa -o testoutdir/SWHAS104.16s_hyperout.txt

#Obatin the microbial community from the hyper variable data
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/obtain_community.pl testoutdir/SWHAS104.16s_hyperout.txt  /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/RefHVR.V6.taxonomy.txt testoutdir/SWHAS104.16s_hvr_community.txt


#Copy number correction
/workhome/JXT/GitProject/Ublastx/Ublastx_stageone/bin/copy_correction.pl testoutdir/SWHAS104.16s_hvr_community.txt /workhome/JXT/GitProject/Ublastx/Ublastx_stageone/DB/Copy_db.copyrighter.txt testoutdir/SWHAS104.16s_hvr_community.adjust.txt
#The script file is testoutdir/ublastx_bash_Tue-Jan-12-11:21:03-2016.sh
