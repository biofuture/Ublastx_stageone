ARGs_OAP singularity version of manual
==========================================

We recommand users try the singualrity version of the pipeline, and you will not need to install many tricky dependence. If you want to use the previouse version, please refer to https://github.com/biofuture/Ublastx_stageone/releases/tag/2.3

If you  have any questions or suggestions on the singularity version of this tool, please leave us a message in the Issues. 

The change log of this version (2021-01-05) includes:
1. Merge two steps into one command for easy of useage
2. Add paralell computing for the blastx step searching against SARG2 database, this accelerats the whole process
3. PcoA plot generated directly

Prepare the meta-data file of your samples  
==========================================
To run the pipeline, users need to prepare relative meta-data.txt file and put all the pair-end fastq file into one directory  
Example of meta-data file **meta-data.txt**  Tips:   
* You need keep the first and second column's name as SampleID and Name
* The SampleID are required to be unique numbers counting from 1 to 2 to 3 etc.
* Category is the classification of your samples into groups and we will colored your samples in PcoA by this informaton
* The meta-data table should be separated by tabular for each of the items 
* The Name of each sample should be the fastq file names for your pair-end Illumina sequencing data, your fastq files will automatically be recognized by Name_1.fq and Name_2.fq, so you need to keep the name consistent with your fq file name. (if you files are end with .fastq or .fasta, you need to change them to end with .fq or .fa)
 
**Please make sure the meta-data file is pure txt format, if you edit the file under windows, using nodepad++ and check the end of each line by cliking View-> Show Symbol -> Show All Characters. If the line is end up with CRLF, please remove the CR by replace \r to nothing in the replace dialogue frame. Please make sure that the fourth column is the lenght of the reads**

SampleID | Name | Category | ReadLength     
---------|------|----------|---------  
 1       | STAS | ST       | 100   
 2       | SWHAS104 | SWH  | 100   

Run the following command to exec the singularity version of the pipeline
==================================
Download  the singularity verion of the pipeline image from the following link (https://ndownloader.figshare.com/files/25953791), due to large file size limitation of github, the sif image is deposited on figshare  
Recommended version 3.5.3 singularity[https://sylabs.io/guides/3.0/user-guide/installation.html] is used    

clone the example data in the repo to your local computer  
   
   git clone  git@github.com:biofuture/Ublastx_stageone.git

Put all your fastq files into one directory in your local system (notice the name of your fastq files should be Name_1.fq and Name_2.fq). your can give -h to show the help information.  Examples could be found in source directory example, in example directory run test:   (The inputdir follow by the -B is  the directory you put your fastq files)
	
    singularity exec -B inputdir argoapv2.5.sif /home/argsoapv2.5/argoap_version2.5 \
    -i inputdir \
    -m meta-data.txt \
    -o testoutdir \
    -n 8 

    singularity exec -B inputdir argoapv2.5.sif /home/argsoapv2.5/argoap_version2.5 -h 
    Author: JIANG Xiaotao
    Modidied : 12-04-2020
    Email: biofuture.jiang@gmail.com
    /home/argsoapv3/argoap_version3 -i <Fq input dir> -m <Metadata_map.txt> -o <output dir> -n [number of threads] -f [fa|fq] -z -h -c [S|U]

    -i Input files directory, required
    -m meta data file, required
    -o Output files directory, default current directory
    -n number of threads used, default 1
    -f the format of processed files, default fq
    -q quality control of fastq sequences defualt not take effect, if set, then will do QC with fastp
    -z whether the fq files were .gz format, if -z, then firstly gzip -d, default(none)    

    #prescreening parameters 
    -x evalue for searching 16S in usearch default 1e-10
    -y evalue for searching universal single copy marker gene default 3
    -v the identity value for diamond to search the USCMGs default  0.45

    #blastx parameters
    -l the length cut off for alignment, default 25 aa 
    -e evalue cut off for an alignment, default 1e-7
    -d the identity cut off for an alignment, default 80 

    #prefix for the output 
    -p this parameters is the output results file prefix default: stage2output
    -r if set, the remove all the intemediate files
    -h print this help information

The results are in testoutdir/  
The files with prefix stage2output are the quantitative tables of resistome in all samples  
check the output directory  

    tree testoutdir/  
    testoutdir/  
    |-- extracted.fa 
    |-- Log.txt 
    |-- meta_data_online.txt
    |-- stage2output.16S.pdf
    |-- stage2output.blast6out2.txt
    |-- stage2output.cell.pdf
    |-- stage2output.normalize_16s.gene.tab.txt
    |-- stage2output.normalize_16s.mergesubtype.tab.txt
    |-- stage2output.normalize_16s.subtype.tab.txt
    |-- stage2output.normalize.16s.txt
    |-- stage2output.normalize_16s.type.tab.txt
    |-- stage2output.normalize_cellnumber.gene.txt
    |-- stage2output.normalize_cellnumber.mergesubtype.tab.txt
    |-- stage2output.normalize_cellnumber.subtype.tab.txt
    |-- stage2output.normalize_cellnumber.type.tab.txt
    |-- stage2output.normalize.cell.txt
    |-- stage2output.ppm.gene.txt
    |-- stage2output.ppm.subtype.txt
    |-- stage2output.ppm.txt
    |-- stage2output.ppm.type.txt
    |-- STAS_1.us
    |-- STAS_2.us
    |-- STAS.extract_1.fa
    |-- STAS.extract_2.fa
    |-- STAS_fixed_1.fa
    |-- STAS_fixed_2.fa
    |-- STAS.sam
    |-- STAS_singletons.fa
    |-- STAS.uscmg_1.dmd
    |-- STAS.uscmg_2.dmd
    |-- STAS.uscmg.blastx.txt
    |-- STAS.uscmg.ko_averagecov.txt
    |-- SWHAS104_1.us
    |-- SWHAS104_2.us
    |-- SWHAS104.extract_1.fa
    |-- SWHAS104.extract_2.fa
    |-- SWHAS104_fixed_1.fa
    |-- SWHAS104_fixed_2.fa
    |-- SWHAS104.sam
    |-- SWHAS104_singletons.fa
    |-- SWHAS104.uscmg_1.dmd
    |-- SWHAS104.uscmg_2.dmd
    |-- SWHAS104.uscmg.blastx.txt
    |-- SWHAS104.uscmg.ko_averagecov.txt
    |-- tmpblast
    |   |-- xaa
    |   |-- xaa.blast.txt
    |   |-- xab
    |   |-- xab.blast.txt
    |   |-- xac
    |   |-- xac.blast.txt
    |   |-- xad
    |   |-- xad.blast.txt
    |   |-- xae
    |   |-- xae.blast.txt
    |   |-- xaf
    |   |-- xaf.blast.txt
    |   |-- xag
    |   |-- xag.blast.txt
    |   |-- xah
    |   `-- xah.blast.txt
    `-- ublastx_bash_Thu-Jan-7-09:41:22-2021.sh
 

The **meta_data_online.txt** includes some intemediate numbers information such as #ofreads, #of16S, #ofCells, etc. All the tables are in the files with prefix: stage2output.

The meta-data-online.txt looks like this 

SampleID | Name | Category | ReadLength |#ofreads | #of16S| **#ofCell**   
---------|------|-----------|----------|-------|----|---- 
 1       | STAS | ST  | 100| 200000 | 10.1  |   4.9
 2       | SWHAS104 | SWH | 100|200000 | 9.7 |    4.1


----------------------------------------------------------------------------------------------------------------
For online version, please refer to http://smile.hku.hk/SARGs
------------------------------------------------------------------------------------------------------------------------  
**Notice:**

This tools only provide the required scripts for ARGs-OAP1.0/2.0 pipeline

This pipeline is distributed in the hope to achieve the aim of management of antibiotic resistant genes in envrionment, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.This pipeline is only allowed to be used for non-commercial and academic purpose.

**The SARG database is distributed only freely used for academic prupose, any commercial use should require the agreement from the developer team.** 
