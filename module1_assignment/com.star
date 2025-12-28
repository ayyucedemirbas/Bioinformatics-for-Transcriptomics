#!/bin/bash

STAR=STAR

DATADIR=.              
STAR2IDX=./StarIndex 
WORKDIR=../Star


mkdir -p $WORKDIR


for sample in 1mo_Rep1 1mo_Rep2 1mo_Rep3 4mo_Rep1 4mo_Rep2 4mo_Rep3
do
  echo "Processing: $sample"
  
  $STAR --runThreadN 4 --genomeDir $STAR2IDX/ \
        --readFilesIn $DATADIR/${sample}.fastq.gz --readFilesCommand zcat \
        --outSAMtype BAM SortedByCoordinate --outSAMstrandField intronMotif \
        --outFileNamePrefix ${WORKDIR}/${sample}_ 
        

  samtools index ${WORKDIR}/${sample}_Aligned.sortedByCoord.out.bam
done

echo "Done."
exit