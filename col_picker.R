### pick certain column for ldsc ###


args=commandArgs(TRUE)

inputs=as.character(args[1])
output=as.character(args[2])

ori_sumstat = read.table(inputs, h=T)

sumstat_sub = ori_sumstat[,c(2,4,5,8,9,10,11)]

write.table(sumstat_sub, file=output, quote=F, row.names=F, col.names=T)
