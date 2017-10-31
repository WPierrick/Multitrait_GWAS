​#!/bin/bash

#PBS −N Test_ldsc
#PBS −l walltime = 15:00:00
#PBS −A UQ−IMB
#PBS −t 1−1000


cd /gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/04_munged/

for i in /gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/04_munged/* ; do 
	a=$(ls | grep -v ${i}) ; 
	for j in $a ; do 
		python /home/uqpwains/binaries/ldsc/ldsc.py --ref-ld-chr /gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/00_snplist_ldsc/eur_w_ld_chr/
		--out "$i"_"$j" --rg "$i", "$j"	--w-ld-chr /gpfs1/scratch/90days/uqpwains/GWA_sumstats/data/00_snplist_ldsc/eur_w_ld_chr/ ; 
	done
done​