#Processing fq 1 begain:
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/Fq2fa.pl inputfqs//STAS_1.fq inputfqs//STAS_1.fa
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/Fq2fa.pl inputfqs//STAS_2.fq inputfqs//STAS_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//STAS_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output//STAS_1.us -threads 10 -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//STAS_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output//STAS_2.us -threads 10 -maxaccepts 1

/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/extract_usearch_reads.pl output//STAS_1.us inputfqs//STAS_1.fa output//STAS.extract_1.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/extract_usearch_reads.pl output//STAS_2.us inputfqs//STAS_2.fa output//STAS.extract_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//STAS_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output//STAS_1.16s -threads 10 -strand both  -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//STAS_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output//STAS_2.16s -threads 10 -strand both  -maxaccepts 1


#Search hyper variable region
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//STAS_1.fa -db  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out output//STAS.16s_1v6.us -threads 10 -strand both  -maxaccepts 10
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//STAS_2.fa -db  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out output//STAS.16s_2v6.us -threads 10 -strand both  -maxaccepts 10

#Cut, filter and merge two fasta files 16S hyper varaible region
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/filter_16shvr.pl -a output//STAS.16s_1v6.us -b output//STAS.16s_2v6.us -c inputfqs//STAS_1.fa -d inputfqs//STAS_2.fa -o output//STAS.16s_hyperout.txt

#Obatin the microbial community from the hyper variable data
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/obtain_community.pl output//STAS.16s_hyperout.txt  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/RefHVR.V6.taxonomy.txt output//STAS.16s_hvr_community.txt


#Copy number correction
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/copy_correction.pl output//STAS.16s_hvr_community.txt /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/Copy_db.copyrighter.txt output//STAS.16s_hvr_normal.copy.txt
#Processing fq 2 begain:
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/Fq2fa.pl inputfqs//SWHAS104_1.fq inputfqs//SWHAS104_1.fa
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/Fq2fa.pl inputfqs//SWHAS104_2.fq inputfqs//SWHAS104_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//SWHAS104_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output//SWHAS104_1.us -threads 10 -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//SWHAS104_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output//SWHAS104_2.us -threads 10 -maxaccepts 1

/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/extract_usearch_reads.pl output//SWHAS104_1.us inputfqs//SWHAS104_1.fa output//SWHAS104.extract_1.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/extract_usearch_reads.pl output//SWHAS104_2.us inputfqs//SWHAS104_2.fa output//SWHAS104.extract_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//SWHAS104_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output//SWHAS104_1.16s -threads 10 -strand both  -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//SWHAS104_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output//SWHAS104_2.16s -threads 10 -strand both  -maxaccepts 1


#Search hyper variable region
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//SWHAS104_1.fa -db  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out output//SWHAS104.16s_1v6.us -threads 10 -strand both  -maxaccepts 10
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/usearch -ublast inputfqs//SWHAS104_2.fa -db  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/RefHVR.V6.udb  -evalue 1e-5 -accel 0.5 -blast6out output//SWHAS104.16s_2v6.us -threads 10 -strand both  -maxaccepts 10

#Cut, filter and merge two fasta files 16S hyper varaible region
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/filter_16shvr.pl -a output//SWHAS104.16s_1v6.us -b output//SWHAS104.16s_2v6.us -c inputfqs//SWHAS104_1.fa -d inputfqs//SWHAS104_2.fa -o output//SWHAS104.16s_hyperout.txt

#Obatin the microbial community from the hyper variable data
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/obtain_community.pl output//SWHAS104.16s_hyperout.txt  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/RefHVR.V6.taxonomy.txt output//SWHAS104.16s_hvr_community.txt


#Copy number correction
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/copy_correction.pl output//SWHAS104.16s_hvr_community.txt /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/Copy_db.copyrighter.txt output//SWHAS104.16s_hvr_normal.copy.txt
#The script file is output//ublastx_bash_Wed-Jan-31-15:43:30-2018.sh
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/bin/merge_extracted_fa_update_metadate.pl inputfqs/ output/ meta-data.txt output//meta_data_online.txt output//extracted.fa S /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/DB/all_KO30_name.list
