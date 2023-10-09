[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

# Kallisto 

kallisto is a program for quantifying abundances of transcripts from bulk and single-cell RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. 

## Input data

In **data** directory, tool searches for (.fastq.gz) sequencing files, (.gtf) annotation files, and (.idx) index from Kallisto-Index. 

- FASTQ files can be either plaintext or gzipped.



## Parameters 

### Main Parameters
Number of Threads
- Number of cores used by featureCounts. If not specified, will use all available. 

Type of Sequencing
- Single or Paired Ended reads

Length of Fragment
- Will be ignored when selecting Type of Sequencing = Paired End.

Standard Deviation of Fragment
- Will be ignored when selecting Type of Sequencing = Paired End.

Output plaintext instead of HDF5

Verbosity 
- Print out progress information every 1M processed reads.

Single Overhang
- Include reads where unobserved rest of fragment is predicted to lie outside a transcript.

First Read Stranded 
- runs kallisto in strand specific mode, only fragments where the first read in the pair pseudoaligns to the forward strand of a transcript are processed. If a fragment pseudoaligns to multiple transcripts, only the transcripts that are consistent with the first read are kept.

Read Reverse Stranded 
- same as --fr-stranded but the first read maps to the reverse strand of a transcript.

## Source 

https://pachterlab.github.io/kallisto/about

## Output

**abundance.h5** - is a HDF5 binary file containing run info, abundance esimates, bootstrap estimates, and transcript length information length. This file can be read in by sleuth

**abundance.tsv** - is a plaintext file of the abundance estimates. It does not contains bootstrap estimates. Please use the --plaintext mode to output plaintext abundance estimates. Alternatively, kallisto h5dump can be used to output an HDF5 file to plaintext. The first line contains a header for each column, including estimated counts, TPM, effective length.

**run_info.json** - is a json file containing information about the run

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)