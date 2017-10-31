install.packages("d3heatmap")
library("d3heatmap")

corrmat <- read.csv("/Users/p.wainschtein/Documents/Multivariate_GWAS/correlation_matrix.csv", header = TRUE, sep = "\t")
row.names(corrmat) <- corrmat[,1]
corrmat$X <- NULL
colnames(corrmat) <- gsub("_colsubset.txt_munged.sumstats.gz", "", paste(colnames(corrmat)))
rownames(corrmat) <- gsub("_colsubset.txt_munged.sumstats.gz", "", paste(rownames(corrmat)))


d3heatmap(as.matrix(corrmat), dendrogram='none', Rowv=FALSE, Colv=FALSE,trace='none')
heatmap.2(as.matrix(corrmat), dendrogram='none', Rowv=FALSE, Colv=FALSE,trace='none')
