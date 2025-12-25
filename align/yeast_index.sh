mkdir -p YeastIndex

STAR --runMode genomeGenerate \
     --runThreadN 4 \
     --genomeDir ./YeastIndex \
     --genomeFastaFiles ./Genome_Ref/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa \
     --sjdbGTFfile ./Genome_Ref/Saccharomyces_cerevisiae.R64-1-1.110.gtf \
     --sjdbOverhang 100 \
     --genomeSAindexNbases 10