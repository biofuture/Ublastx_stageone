#Processing fq 1 begain:
perl  /workhome/JXT/GitProject/ublastxv1.1/bin/Fq2fa.pl inputfqs/STAS_1.fq inputfqs/STAS_1.fa
perl  /workhome/JXT/GitProject/ublastxv1.1/bin/Fq2fa.pl inputfqs/STAS_2.fq inputfqs/STAS_2.fa
/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/STAS_1.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_1.us -threads 1 -maxaccepts 1
/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/STAS_2.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_2.us -threads 1 -maxaccepts 1

/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/STAS_1.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_1.16s -threads 1 -strand both  -maxaccepts 1
/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/STAS_2.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/STAS_2.16s -threads 1 -strand both  -maxaccepts 1

/workhome/JXT/GitProject/ublastxv1.1/bin/extract_usearch_reads.pl testoutdir/STAS_1.us inputfqs/STAS_1.fa testoutdir/STAS.extract_1.fa
/workhome/JXT/GitProject/ublastxv1.1/bin/extract_usearch_reads.pl testoutdir/STAS_2.us inputfqs/STAS_2.fa testoutdir/STAS.extract_2.fa
#Processing fq 2 begain:
perl  /workhome/JXT/GitProject/ublastxv1.1/bin/Fq2fa.pl inputfqs/SWHAS104_1.fq inputfqs/SWHAS104_1.fa
perl  /workhome/JXT/GitProject/ublastxv1.1/bin/Fq2fa.pl inputfqs/SWHAS104_2.fq inputfqs/SWHAS104_2.fa
/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_1.us -threads 1 -maxaccepts 1
/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/SARDB.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_2.us -threads 1 -maxaccepts 1

/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/SWHAS104_1.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_1.16s -threads 1 -strand both  -maxaccepts 1
/workhome/JXT/GitProject/ublastxv1.1/bin/usearch -ublast inputfqs/SWHAS104_2.fa -db /workhome/JXT/GitProject/ublastxv1.1/DB/gg85.udb -evalue 1e-5 -accel 0.5 -blast6out testoutdir/SWHAS104_2.16s -threads 1 -strand both  -maxaccepts 1

/workhome/JXT/GitProject/ublastxv1.1/bin/extract_usearch_reads.pl testoutdir/SWHAS104_1.us inputfqs/SWHAS104_1.fa testoutdir/SWHAS104.extract_1.fa
/workhome/JXT/GitProject/ublastxv1.1/bin/extract_usearch_reads.pl testoutdir/SWHAS104_2.us inputfqs/SWHAS104_2.fa testoutdir/SWHAS104.extract_2.fa
