
Welcome to the Ublastx Version 1.2 wiki! 

# Ublastx vertion 1.2 stageone
This is the source code for Ublastx stage one analysis

Ublastx include two steps

1: using usearch to search agianst structure antibiotic resistent gene (SARG) database to identify the potential ARGs reads and determine the cell number of shotgun metagenomics sequencing data set by 16S hyper variable information

2: using blastx to curate the searching results of usearch and identification of type/subtype ARGs abundance normalize to cell number, the final resutls are types/subtypes ARGs/Cell averagly

To run Ublastx, users should download the stage one source code into local computer system and upload the generated files for stage two onto our Galaxy analysis platform. 

##**What does Ublastx do:**   
1. Fast environmental searching of antibiotic resistant gene in multipile metagenomics data sets; the ARGs abundance were normalized to cell number (updated by version 1.2)
2. Generate mother table of type and sub-type level ARGs of users' samples and a merged sub-type level mother table    
3. Generate a PcoA of users samples with other typical environment samples such as human gut, ocean and sediment to show the relationship of user concerned samples with already sequenced environment.

###clone source code into local computer
    git clone  https://github.com/biofuture/Ublastx_stageone.git  
###Prepare the meta-data file of your samples
 To run the stage one pipeline, users need to prepare relative meta-data.txt file and put all the pair-end fastq file into one directory  
Example of meta-data file **meta-data.txt**  Tips:   
* You need keep the first and second column's name as SampleID and Name
* The SampleID are required to be numbers counting from 1 to 2 to 3 etc.
* Category is the classification of your samples into groups and we will colored your samples in PcoA with this informaton
* The meta-data table should be separated by tabular for each of the items 
* The Name of each sample should be the fastq file names for your pair-end Illumina sequencing data, your fastq files will automatically be recognized by Name_1.fq and Name_2.fq, so you need to keep the name consistent with your fq file name.  For example your have two pair end samples STAS_1.fq STAS_2.fq and SWHAS104_1.fq SWHAS104_2.fq. The meta-data.txt could be like this.

SampleID | Name | Category | Librarysize
---------|------|-----------|------------ 
 1       | STAS | ST  |         300  
 2       | SWHAS104 | SWH  |         300

###Stage one pipeline

When meta-data.txt is prepared, then put all your fastq files into one directory in your local system (notice the name of your fastq files should be Name_1.fq and Name_2.fq). your can give -h to show the help information. Examples could be found in source directory example, in example directory run test:   

`../ublastx_stage_one  -i inputfqs -o testoutdir -m meta-data.txt`  

This step will search reads against Structural ARG database and 16S greengene non-redundant 85 OTUs database to identify potential ARG reads and 16S reads. This step will generated searching results files for each fastq.  
 
Then using another scripts, we will generate the files for stage two of Ublastx.   
` perl merge_extracted_fa_update_metadate.pl  <Indir> <outdir> <meta_data_in> <meta_data_out> <extracted fasta>`  

Input parameters
* \<Indir\> is the input directory of your fastq files
* \<outdir\> is the testourdir
* \<meta_data_in\> is the meta-data.txt  

Output parameters
* \<meta_data_out\> is the meta-data file for stage two analysis (named by users)
* \<extracted fasta\> is the potential reads from all users metagenomics datasets (named by users)

The above script will merged all the extracted potential ARG reads into one fasta file and add two column size of each sample (# of reads) and 16S copies (# of reads) into meta-data file to generate the meta_data_out 
The example runs like this, in directory example/ after running stage one pipeline  
`perl ../merge_extracted_fa_update_metadate.pl  inputfqs testoutdir meta-data.txt meta-data-online.txt extracted.merge.fasta`  

###Stage two pipeline on Galaxy system and download results

Go to http://smile.hku.hk/SARGs and using the module ARG_OAP.  

1. Using Load data module to upload the extracted fasta file and meta_data_out file generated in stage one into Galaxy  
2. Click ARG_Annotation and select your uploaded files  
3. For \"Column in Metadata:\" chose the column you want to classify your samples  

Click submit

After a while or so, you will notice that their are four files generated for your information.  
 
1. PcoA figures of your samples and other environment samples  
2. Other three tabular mother tables which including the profile of ARGs type and sub type information, as well as other environment samples mother table  



