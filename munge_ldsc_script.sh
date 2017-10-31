#!/bin/bash

for i in /home/uqpwains/GWA_sumstats/formatted/Munged_ldsc/* ;
	do python /home/uqpwains/binaries/ldsc/munge_sumstats.py --out "$i"_munged --merge-alleles /90days/uqpwains/GWA_sumstats/data/w_hm3.snplist --N 10000 --sumstats "$i" ;
done

