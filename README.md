ARGs_OAP manual
==========================================

A singularity version of ARGsOAP will be released soon! With singularity, users do not  need to bother about dependence and installation and also easy to use, the sif image can run on any computer with singularity installed. 
====


The change log of this version (2020.07.15) includes:
1. pipeline modification
No usearch now (We tested minimap2 and find that the minimap2 is faster and equvalently accurate, thanks Xiaole Yin for the testing of minimap2 and replacement of usearch)
Now, we use minimap2 and diamond. For using usearch, please refer the older version. 
2. pipeline modification 2
In stage one, we removed parameter "-s" and "-c"
Now, the Read Length is a column in the in the meta-data.txt! need to be filled by the user!!! 

Prepare compulsory command
============================
1. bbmap
a. download packages from here (https://sourceforge.net/projects/bbmap/)
b. install bbmap
c. copy the whole folder "bbmap" into the subfoler "bin" under "Ublastx_stageone"

2. samtools
a. download packages from here (http://www.htslib.org/download/)
b. install samtools
c. copy executable "samtools" into the subfoler "bin" under "Ublastx_stageone"

3. mimimap2
a. download packages from here (https://github.com/lh3/minimap2)
b. install minimap2
c. copy executable "mimimap2" into the subfoler "bin" under "Ublastx_stageone"



Prepare the meta-data file of your samples  
==========================================
To run the stage one pipeline, users need to prepare relative meta-data.txt file and put all the pair-end fastq file into one directory  
Example of meta-data file **meta-data.txt**  Tips:   
* You need keep the first and second column's name as SampleID and Name
* The SampleID are required to be unique numbers counting from 1 to 2 to 3 etc.
* Category is the classification of your samples into groups and we will colored your samples in PcoA by this informaton
* The meta-data table should be separated by tabular for each of the items 
* The Name of each sample should be the fastq file names for your pair-end Illumina sequencing data, your fastq files will automatically be recognized by Name_1.fq and Name_2.fq, so you need to keep the name consistent with your fq file name. (if you files are end with .fastq or .fasta, you need to change them to end with .fq or .fa)
 
**Please make sure the meta-data file is pure txt format, if you edit the file under windows, using nodepad++ and check the end of each line by cliking View-> Show Symbol -> Show All Characters. If the line is end up with CRLF, please remove the CR by replace \r to nothing in the replace dialogue frame**

SampleID | Name | Category | ReadLength     
---------|------|----------|---------  
 1       | STAS | ST       | 100   
 2       | SWHAS104 | SWH  | 100   

Stage one
==================
Put all your fastq files into one directory in your local system (notice the name of your fastq files should be Name_1.fq and Name_2.fq). your can give -h to show the help information. Examples could be found in source directory example, in example directory run test:   

nohup ./argoap_pipeline_stageone_version2.3 -i inputfqs -o testoutdir -m meta-data.txt -n 8

    ./argoap_pipeline_stageone_version2.3  -h

The results are in testoutdir/

The **extracted.fa** and **meta_data_online.txt** are two files needed for ublastx_stage_two analysis.   

The meta-data-online.txt looks like this 

SampleID | Name | Category | ReadLength |#ofreads | #of16S| **#ofCell**   
---------|------|-----------|----------|-------|----|---- 
 1       | STAS | ST  | 100| 200000 | 10.1  |   4.9
 2       | SWHAS104 | SWH | 100|200000 | 9.7 |    4.1


Stage two
========================================================
Normally, just run
    nohup perl argoap_pipeline_stagetwo_version2 -i extracted.fa -m meta_data_online.txt -o testout -l 25 -d 80 -e 1e-5

For users have very big data and prefer complex running:
1. users run locally by themselves to get the blastx outfmt 6 format resutls by alighment against SARG2.2.
**A typical scene is that users can paralelly run the blastx on clusters by multi-nodes, and then merge the blastx output as the input for the -b option.**
2. Prerequest 
    a. download the whole fold of this repo.    
    b. install R packages **vegan, labdsv, ggplot2 and scales**  (Enter R and use install.packages(pkgs="vegan") to install these packages).
3. use -b option for the stage two script: 
perl argoap_pipeline_stagetwo_version2 -i extracted.fa -m meta_data_online.txt -o testout -b merge_blastx.out.txt

Stage two pipeline on Galaxy system and download results
========================================================
Go to http://smile.hku.hk/SARGs  and using the module ARG_OAP.  

1. Using **ARG_OAP** -> **Upload Files** module to upload the extracted fasta file and meta_data_online.txt file generated in stage one into Galaxy  
2. Click **ARG_OAP** and **Ublast_stagetwo**, select your uploaded files  
3. For \"Column in Metadata:\" chose the column you want to classify your samples (default: 3)

Click **Execute** and you can find four output files for your information

After a while or so, you will notice that their are four files generated for your information.  
 
**File 1 and 2**: PcoA figures of your samples and other environment samples generated by ARGs abundance matrix normalization to 16s reads number and cell number  
**File 3 and 4**: Other tabular mother tables which including the profile of ARGs type and sub type information, as long as with other environment samples mother table. File3 results of ARGs abundance normalization aganist 16S reads number; File 4 results of ARGs abundance normalization aganist cell number



There are some questions raised by users, please refer to the [FAQ](https://github.com/biofuture/Ublastx_stageone/wiki/FAQ) for details.  To run ARG OAP locally, users should download the source code into local computer system (Unix/Linux). Users can upload the generated files for stage two onto our Galaxy analysis platform (http://smile.hku.hk/SARGs) or use the local version of stage two script. 

------------------------------------------------------------------------------------------------------------------------  
**Notice:**

This tools only provide the required scripts for ARGs-OAP1.0/2.0 pipeline

This pipeline is distributed in the hope to achieve the aim of management of antibiotic resistant genes in envrionment, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.This pipeline is only allowed to be used for non-commercial and academic purpose.

**The SARG database is distributed only freely used for academic prupose, any commercial use should require the agreement from the developer team.** 

