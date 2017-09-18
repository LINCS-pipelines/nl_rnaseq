library(LINCSDataPortal)
library(readxl)
library(DESeq2)

download_dataset("LDS-1398")
untar("LDS-1398.tar.gz", exdir = ".")
system("rm *tar.gz")

countsTable_ldp <- data.frame(read_xlsx ("./LDS-1398/iMN_DESeq_DataLevel3_20170426_COMPLETE.xlsx", sheet = 1))
rownames(countsTable_ldp) <- countsTable_ldp[,1]
countsTable_ldp <- countsTable_ldp[,-1]

ALS <- grep("ALS", colnames(countsTable_ldp))
CTR <- grep("CTR", colnames(countsTable_ldp))
countsTable_ldp <- countsTable_ldp[,c(ALS, CTR)]

conds<- factor(c(rep("ALS",length(ALS)),rep("CTR",length(CTR))))
conds <- relevel(conds, "CTR")
#id=substr(colnames(countsTable_ldp),0,3)
id=substr(colnames(countsTable_ldp),7,9)
colData=data.frame(condition=conds,subject=id) 

dds<-DESeqDataSetFromMatrix(countsTable_ldp,colData,design=~ condition)
ddsCollapsed <- collapseReplicates(dds,groupby = dds$subject,renameCols = F)
dds<-ddsCollapsed
dds<-DESeq(dds)
res <- results(dds)
result_ldp <-res[order(res$padj),]

write.csv(result_ldp, file = "result.csv")
sessionInfo()
