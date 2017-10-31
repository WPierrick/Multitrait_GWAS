#!/bin/bash

#PBS −N Reformat
#PBS −l nodes =1:ppn=10:Special, pmem=5GB
#PBS −l walltime = 15:00:00
#PBS −A UQ−IMB−CNSG



for i in /home/uqpwains/GWA_sumstats/data/03_colpicked/* ;
	do Rscript /home/uqpwains/GWA_sumstats/Scripts/reformat_OR_Beta_col.R "$i" ; 
done
