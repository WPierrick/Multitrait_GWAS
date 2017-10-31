### Change OR in Betas ###

args=commandArgs(TRUE)

inputs=as.character(args[1])
#output=as.character(args[2])

ori_sumstat = read.table(inputs, h=T)
if ("OR" %in% colnames(ori_sumstat)) {
  ori_sumstat$OR <- log(ori_sumstat$OR)
names(ori_sumstat)[names(ori_sumstat) == 'OR'] <- 'BETA'

write.table(ori_sumstat, file=inputs, quote=F, row.names=F, col.names=T)
}
