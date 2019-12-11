


#************************************************
library(preprocessCore)
#*************************************************
# Read raw data
#************************************************
Raw<-read.table("RawData.txt",sep = "\t",header = T)
#************************************************
#calculate log2
#************************************************
edata = log2(Raw[,-1])
colramp = colorRampPalette(c(3,"white",2))(142)
plot(density(edata[,1]),col=colramp[1],lwd=3,ylim=c(0,60),main = "log2 ratio of unormalized data")
for(i in 2:142){lines(density(edata[,i]),lwd=3,col=colramp[i])}
#*******************************************************
norm_edata = normalize.quantiles(as.matrix(edata))
plot(density(norm_edata[,1]),col=colramp[1],lwd=3,ylim=c(0,6),main = "quantile normalization of log2 ratios of unormalized data")
for(i in 2:142){lines(density(norm_edata[,i]),lwd=3,col=colramp[i])}
#******************************************************
write.table(norm_edata,file = "NormData.txt",sep = "\t")
#***********************************************************

