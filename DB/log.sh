usearch -makeudb_ublast 91_otus.fasta -output gg91.udb

usearch -makeudb_ublast SARDB_20150706.fasta -output SARDB.udb

makeblastdb -dbtype prot -in SARDB_20150706.fasta -out SARDBBLASTX
