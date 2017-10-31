# Multivariate GWAS

install.packages("matlib")
library(matlib)
require(matlib)


setwd("/Users/p.wainschtein/Downloads/")

# Load a correlation matrix across traits
genet_corr <- read.csv("Corr.csv")
row.names(genet_corr) <- genet_corr$X
genet_corr <- genet_corr[,-1]
dim(genet_corr)
genet_corr <- genet_corr[1:50,1:50]
for(i in 1:50){ 
  for (j in 1:50)    
    if (i == j){
      genet_corr[i,j] <- 1;
    }
}

corr_matrix <- as.matrix(genet_corr)
inverse_corr_mat <- Inverse(corr_matrix)
inv_corr_mat <- inv(corr_matrix)

# Get GWAS sumstat data, reorder them, and take a subset
#Load
GWAS_height <- read.table("/Users/p.wainschtein/Documents/Height_GIANT_Wood_etal_2014", header = TRUE)
GWAS_BMI <- read.table("/Users/p.wainschtein/Documents/BMI_GIANT_Eur_2015", header = TRUE)
#Order SNPs
GWAS_BMI_order <- GWAS_BMI[order(GWAS_BMI$SNP),]
GWAS_height_order <- GWAS_height[order(GWAS_height$SNP),]
#Take a subset
GWAS_BMI_subset <- GWAS_BMI_order[1:5000, c(2,8,9,10)]
GWAS_height_subset <- GWAS_height_order[1:5000, c(2,8,9,10)]
# Compute test statistic for one SNP
inv_corr_mat_subset <- inv_corr_mat[1:2,1:2]
chisqr_SNPn <- list()
for(i in 1:5000){
  SNPi <- c((GWAS_BMI_subset[i,2]/GWAS_BMI_subset[i,3])^2, (GWAS_height_subset[i,2]/GWAS_height_subset[i,3])^2)
  chisqr_SNPi <- t(SNPi) %*% inv_corr_mat_subset %*% SNPi
  chisqr_SNPn <- c(chisqr_SNPn, chisqr_SNPi)
}
chisqr_SNPn <- as.matrix(chisqr_SNPn)
plot(chisqr_SNPn)
colnames(chisqr_SNPn)[which(names(chisqr_SNPn) == "Chisqrt")] <- "Chisq"
chisqr_SNPn$Absval <- sqrt(chisqr_SNPn[,1])