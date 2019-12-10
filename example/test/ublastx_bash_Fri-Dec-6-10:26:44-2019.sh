#Processing fq 1 begain:
/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db /home/lg209ws2/Ublastx_stageone/DB/SARG.2.2.udb -evalue 1e-5 -accel 0.5 -blast6out test/STAS_1.us -threads 15 -maxaccepts 1
/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db /home/lg209ws2/Ublastx_stageone/DB/SARG.2.2.udb -evalue 1e-5 -accel 0.5 -blast6out test/STAS_2.us -threads 15 -maxaccepts 1

/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_1.fa -db /home/lg209ws2/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out test/STAS_1.16s -threads 15 -strand both  -maxaccepts 1
/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/STAS_2.fa -db /home/lg209ws2/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out test/STAS_2.16s -threads 15 -strand both  -maxaccepts 1

/home/lg209ws2/Ublastx_stageone/bin/extract_usearch_reads.pl test/STAS_1.us inputfqs/STAS_1.fa test/STAS.extract_1.fa
/home/lg209ws2/Ublastx_stageone/bin/extract_usearch_reads.pl test/STAS_2.us inputfqs/STAS_2.fa test/STAS.extract_2.fa

#Using Diamond to search USCMGs
/home/lg209ws2/Ublastx_stageone/bin/diamond blastx -q inputfqs/STAS_1.fa -d /home/lg209ws2/Ublastx_stageone/DB/KO30_DIAMOND.dmnd -o test/STAS.uscmg_1.dmd -f tab  -p 15 -e 3  --id 0.45 --max-target-seqs 1
/home/lg209ws2/Ublastx_stageone/bin/diamond blastx -q inputfqs/STAS_2.fa -d /home/lg209ws2/Ublastx_stageone/DB/KO30_DIAMOND.dmnd -o test/STAS.uscmg_2.dmd -f tab  -p 15  -e 3 --id 0.45 --max-target-seqs 1
cat test/STAS.uscmg_1.dmd test/STAS.uscmg_2.dmd > test/STAS.uscmg.blastx.txt
#Processing fq 2 begain:
/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /home/lg209ws2/Ublastx_stageone/DB/SARG.2.2.udb -evalue 1e-5 -accel 0.5 -blast6out test/SWHAS104_1.us -threads 15 -maxaccepts 1
/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /home/lg209ws2/Ublastx_stageone/DB/SARG.2.2.udb -evalue 1e-5 -accel 0.5 -blast6out test/SWHAS104_2.us -threads 15 -maxaccepts 1

/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /home/lg209ws2/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out test/SWHAS104_1.16s -threads 15 -strand both  -maxaccepts 1
/home/lg209ws2/Ublastx_stageone/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /home/lg209ws2/Ublastx_stageone/DB/gg85.udb -evalue 1e-10 -accel 0.5 -blast6out test/SWHAS104_2.16s -threads 15 -strand both  -maxaccepts 1

/home/lg209ws2/Ublastx_stageone/bin/extract_usearch_reads.pl test/SWHAS104_1.us inputfqs/SWHAS104_1.fa test/SWHAS104.extract_1.fa
/home/lg209ws2/Ublastx_stageone/bin/extract_usearch_reads.pl test/SWHAS104_2.us inputfqs/SWHAS104_2.fa test/SWHAS104.extract_2.fa

#Using Diamond to search USCMGs
/home/lg209ws2/Ublastx_stageone/bin/diamond blastx -q inputfqs/SWHAS104_1.fa -d /home/lg209ws2/Ublastx_stageone/DB/KO30_DIAMOND.dmnd -o test/SWHAS104.uscmg_1.dmd -f tab  -p 15 -e 3  --id 0.45 --max-target-seqs 1
/home/lg209ws2/Ublastx_stageone/bin/diamond blastx -q inputfqs/SWHAS104_2.fa -d /home/lg209ws2/Ublastx_stageone/DB/KO30_DIAMOND.dmnd -o test/SWHAS104.uscmg_2.dmd -f tab  -p 15  -e 3 --id 0.45 --max-target-seqs 1
cat test/SWHAS104.uscmg_1.dmd test/SWHAS104.uscmg_2.dmd > test/SWHAS104.uscmg.blastx.txt
#The script file is test/ublastx_bash_Fri-Dec-6-10:26:44-2019.sh
/home/lg209ws2/Ublastx_stageone/bin/merge_extracted_fa_update_metadate.pl inputfqs test meta-data.txt test/meta_data_online.txt test/extracted.fa U /home/lg209ws2/Ublastx_stageone/DB/all_KO30_name.list
