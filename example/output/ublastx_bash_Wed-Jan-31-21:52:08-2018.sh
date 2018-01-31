#Processing fq 1 begain:
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/fastp -i inputfqs/STAS_1.fq -I inputfqs/STAS_2.fq -o inputfqs/STAS.fastp.1.fq -O inputfqs/STAS.fastp.2.fq -w 15 -j inputfqs/STAS.jason -h inputfqs/STAS.html
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/Fq2fa.pl inputfqs/STAS.fastp.1.fq inputfqs/STAS_1.fa
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/Fq2fa.pl inputfqs/STAS.fastp.2.fq inputfqs/STAS_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/STAS_1.us -threads 15 -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/STAS_2.us -threads 15 -maxaccepts 1

/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/STAS_1.us inputfqs/STAS_1.fa output/STAS.extract_1.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/STAS_2.us inputfqs/STAS_2.fa output/STAS.extract_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/STAS_1.16s -threads 15 -strand both  -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/STAS_2.16s -threads 15 -strand both  -maxaccepts 1


#Using Diamond to search USCMGs
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/STAS_1.fa -d /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/STAS.uscmg_1.dmd -f tab  -p 15 -e 3  --id 0.45 --max-target-seqs 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/STAS_2.fa -d /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/STAS.uscmg_2.dmd -f tab  -p 15  -e 3 --id 0.45 --max-target-seqs 1
cat output/STAS.uscmg_1.dmd output/STAS.uscmg_2.dmd > output/STAS.uscmg.blastx.txt
#Processing fq 2 begain:
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/fastp -i inputfqs/SWHAS104_1.fq -I inputfqs/SWHAS104_2.fq -o inputfqs/SWHAS104.fastp.1.fq -O inputfqs/SWHAS104.fastp.2.fq -w 15 -j inputfqs/SWHAS104.jason -h inputfqs/SWHAS104.html
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/Fq2fa.pl inputfqs/SWHAS104.fastp.1.fq inputfqs/SWHAS104_1.fa
perl  /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/Fq2fa.pl inputfqs/SWHAS104.fastp.2.fq inputfqs/SWHAS104_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/SWHAS104_1.us -threads 15 -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/SWHAS104_2.us -threads 15 -maxaccepts 1

/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/SWHAS104_1.us inputfqs/SWHAS104_1.fa output/SWHAS104.extract_1.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/SWHAS104_2.us inputfqs/SWHAS104_2.fa output/SWHAS104.extract_2.fa
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/SWHAS104_1.16s -threads 15 -strand both  -maxaccepts 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/SWHAS104_2.16s -threads 15 -strand both  -maxaccepts 1


#Using Diamond to search USCMGs
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/SWHAS104_1.fa -d /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/SWHAS104.uscmg_1.dmd -f tab  -p 15 -e 3  --id 0.45 --max-target-seqs 1
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/SWHAS104_2.fa -d /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/SWHAS104.uscmg_2.dmd -f tab  -p 15  -e 3 --id 0.45 --max-target-seqs 1
cat output/SWHAS104.uscmg_1.dmd output/SWHAS104.uscmg_2.dmd > output/SWHAS104.uscmg.blastx.txt
#The script file is output/ublastx_bash_Wed-Jan-31-21:52:08-2018.sh
/sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/merge_extracted_fa_update_metadate.pl inputfqs output meta-data.txt output/meta_data_online.txt output/extracted.fa U /sharedisk3/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/all_KO30_name.list
