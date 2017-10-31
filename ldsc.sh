#!/bin/bash

set -- value1 value2 "value with spaces"
for a; do
    shift
    for b; do
        printf "%s - %s\n" "$a" "$b"
    done
done

 for i in file*; do
   for j in file*; do
      if [cat $i -lt $j ];>> thenresult_folder/$i_$j;
 cat $i $j >>  rm result_folder/$i_$j;$j_$i fi2>/dev/null
   done
 done



for i in file*; do
  for j in file*; do
     cat $i $j >> result_folder/$i_$j;
     rm result_folder/$j_$i 2>/dev/null
  done
 done



#!/bin/bash
cd /gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/04_munged/
arr=( $(ls) )
tLen=${#arr[@]}

for i in $arr; do
    for j in `seq $((i+1)) tlen`; do
    	echo $i $j
        ldsc --ref-ld-chr /ibscratch/wrayvisscher/robert/data/ldscores/eur_w_ld_chr/
--out data/rgs/Schizophrenia-WHR_BMIadj
--rg data/ldscore/Schizophrenia.sumstats.gz,data/ldscore/WHR_BMIadj.sumstats.gz
--w-ld-chr /ibscratch/wrayvisscher/robert/data/ldscores/eur_w_ld_chr/
    done
done





#!/bin/bash

#PBS -N ldsc
#PBS -A UQ-IMB-CNSG
#PBS -o /30days/uqikass1/job_reports/
#PBS -e /30days/uqikass1/job_reports/
#PBS -l nodes=1:ppn=10:Special,pmem=1gb
#PBS -l walltime=45:00:00
#PBS -t 1-45

ldsc='/home/uqpwains/binaries/ldsc/ldsc.py'


list='/gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/04_munged/names.txt'
names1=$(awk 'FNR == '${PBS_ARRAYID}' {print $1}' $list)
names2=$(awk 'FNR == '${PBS_ARRAYID}' {print $2}' $list)

	python ldsc  --ref-ld-chr /gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/00_snplist_ldsc/eur_w_ld_chr/
		--out d/home/uqpwains/GWA_sumstats/data/06_genetic_correlations/$name1-$names2 --rg "$names1", "$manes2"	--w-ld-chr /gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/00_snplist_ldsc/eur_w_ld_chr/




path<-"/gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/04_munged/"
names<-dir(path, pattern="*.sumstats.gz")
length(names)

tmp<-as.data.frame(names)

for(i in 1:length(names)){
	test<-as.data.frame(tmp[i+1:nrow(tmp),])
	test$V2<-tmp[i,1]

	if(i==1){
		output<-test
	}else if(i>1){
		output<-rbind(output, test)
	}
}


output2<-na.omit(output)

write.table(output2, paste(path, "names.txt", sep=""), col.names=F, row.names=F, quote=F, sep="\t")
