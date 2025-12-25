#!/bin/bash -i

## STAR script
STAR=STAR
BASEDIR=./
DATADIR=${BASEDIR} 
WORKDIR=${BASEDIR}/Star

mkdir -p $WORKDIR 

STAR2IDX=${BASEDIR}/YeastIndex

for i in SRR390728 SRR390729
do
  echo "---------------------------------"
  echo "Processing: $i"
  
  # RAM limit: 500 MB
  # We are using 'gunzip -c' for Mac
  # Paired-End (_1 and _2)
  
  time \
  $STAR --limitBAMsortRAM 500000000 --runThreadN 4 --genomeDir $STAR2IDX/ \
        --readFilesIn ${DATADIR}/${i}_1.fastq.gz ${DATADIR}/${i}_2.fastq.gz \
        --readFilesCommand gunzip -c \
        --outSAMtype BAM SortedByCoordinate --outSAMstrandField intronMotif \
        --outFileNamePrefix ${WORKDIR}/${i}_ &> ${WORKDIR}/${i}.star.log
done

wait

echo "Done!"
exit;