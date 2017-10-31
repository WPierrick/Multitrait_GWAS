#Script that converts PVALUE to ZVALUE

#Bash command: for i in ./Unzipped/* ; do Rscript Zscore_conversion.R "$i" "$i"_impg.txt ; done
args=commandArgs(TRUE)
inputs=as.character(args[1])
output=as.character(args[2])


#Z <- 2.4
#pv <- function(Z){
#  pchisq(Z^2,df=1,lower.tail = FALSE)
#}

getzcore <- function(pvalue,signOftheEffect){
  sqrt( qchisq(pvalue,df=1,lower.tail = FALSE) ) * signOftheEffect
}

ori_sumstat = read.table(imputs, h=T)

sumstat_sub = ori_sumstat
sumstat_sub$ZVALUE <- 0
for(i in 1:nrow(ori_sumstat)) {
if (ori_sumstat[i,4] >= 0) {
  sumstat_sub$ZVALUE <- getzcore(ori_sumstat$PVAL,1)
} else {
  sumstat_sub$ZVALUE <- getzcore(ori_sumstat$PVAL,-1)
}
}
write.table(sumstat_sub, file=output, quote=F, row.names=F, col.names=T)