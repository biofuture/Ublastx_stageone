#Processing fq 1 begain:
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_1.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/STAS_1.us -threads 60 -maxaccepts 1
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_2.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/STAS_2.us -threads 60 -maxaccepts 1

/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/STAS_1.us inputfqs/STAS_1.fa output/STAS.extract_1.fa
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/STAS_2.us inputfqs/STAS_2.fa output/STAS.extract_2.fa
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_1.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/STAS_1.16s -threads 60 -strand both  -maxaccepts 1
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/STAS_2.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/STAS_2.16s -threads 60 -strand both  -maxaccepts 1


#Using Diamond to search USCMGs
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/STAS_1.fa -d /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/STAS.uscmg_1.dmd -f tab  -p 60 -e 3  --id 0.45 --max-target-seqs 1
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/STAS_2.fa -d /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/STAS.uscmg_2.dmd -f tab  -p 60  -e 3 --id 0.45 --max-target-seqs 1
cat output/STAS.uscmg_1.dmd output/STAS.uscmg_2.dmd > output/STAS.uscmg.blastx.txt
#Processing fq 2 begain:
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/SWHAS104_1.us -threads 60 -maxaccepts 1
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/SARGV2.0.udb -evalue 1e-5 -accel 0.5 -blast6out output/SWHAS104_2.us -threads 60 -maxaccepts 1

/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/SWHAS104_1.us inputfqs/SWHAS104_1.fa output/SWHAS104.extract_1.fa
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/extract_usearch_reads.pl output/SWHAS104_2.us inputfqs/SWHAS104_2.fa output/SWHAS104.extract_2.fa
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/SWHAS104_1.16s -threads 60 -strand both  -maxaccepts 1
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out output/SWHAS104_2.16s -threads 60 -strand both  -maxaccepts 1


#Using Diamond to search USCMGs
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/SWHAS104_1.fa -d /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/SWHAS104.uscmg_1.dmd -f tab  -p 60 -e 3  --id 0.45 --max-target-seqs 1
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/diamond blastx -q inputfqs/SWHAS104_2.fa -d /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/KO30_DIAMOND.dmnd -o output/SWHAS104.uscmg_2.dmd -f tab  -p 60  -e 3 --id 0.45 --max-target-seqs 1
cat output/SWHAS104.uscmg_1.dmd output/SWHAS104.uscmg_2.dmd > output/SWHAS104.uscmg.blastx.txt
#The script file is output/ublastx_bash_Mon-Apr-9-09:36:45-2018.sh
/sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/bin/merge_extracted_fa_update_metadate.pl inputfqs output meta-data.txt output/meta_data_online.txt output/extracted.fa U /sharedisk/XT-Workhome/JXT/GitProject/ARGs-OAP-V2.0-DIST/ublastx_stage_one/DB/all_KO30_name.list
