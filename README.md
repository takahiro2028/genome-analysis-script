# FastQC Automation Script for HiFi Reads

## Overview

This repository contains a shell script for running FastQC on compressed FASTQ files.  
The script was created to automate quality control of HiFi sequencing reads used in genome analysis.

大学院で扱っているHiFiリードの品質確認を効率化するために作成したシェルスクリプトです。  
FastQCを用いて、FASTQファイルの品質評価を自動で実行します。

## Purpose

Genome sequencing data can be very large, so manual execution of quality control commands is inefficient and error-prone.  
This script helps standardize the QC process by automating:

- Conda environment activation
- FastQC execution
- Multi-thread processing
- Output directory specification
- Log file generation
- Start and finish time recording

## Tools

- Bash
- Conda
- FastQC v0.12.1

## Script

```bash
#!/bin/bash

source /home/taka/miniconda3/etc/profile.d/conda.sh
conda activate fastqc-0.12.1-0

i=test.fastq.gz
output_dir=/home/tools/fastqc

uname -n
echo -n "# start:"
date
echo ""

echo "fastqc -t 16 --nogroup -o ${output_dir} ${i}"
fastqc -t 16 --nogroup \
       -o ${output_dir} ${i} \
       1>fastqc.log 2>fastqc.err

echo ""
echo -n "# finish:"
date
