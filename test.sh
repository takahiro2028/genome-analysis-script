#!/bin/bash                                                                                                                                                                                              
                                                                                                                                                                                                          

source /home/taka/miniconda3/etc/profile.d/conda.sh
conda activate fastqc-0.12.1-0

i=test.fastq.gz
output_dir=/home/tools/fastqc

uname -n
echo -n "# start:"
date
echo ""

echo "fastqc -t 16 --nogroup -o $i > ${i}.fastqc"
fastqc -t 16 --nogroup\
       -o ${output_dir} $i\
       1>fastqc.log 2>fastqc.err

echo ""
echo -n "# finish:"
date
