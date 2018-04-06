
mothertable <- read.table(file="teststagetwoout.normalize_16s.mergesubtype.tab.txt", sep="\t",header=T,row.names=1,quote = "", stringsAsFactors = FALSE)
#remove zero line
mothertable <- mothertable[which(rowSums(mothertable)!=0),]
mothertable <- t(mothertable)
mothertable <- mothertable[which(rowSums(mothertable)!=0),]
dim(mothertable)

library(vegan)
library(labdsv)
library(ggplot2)
library(scales)
cols <- c("ST", "SWH", "DrinkingwaterSystem", "DrinkingwaterSystem", "DrinkingwaterSystem", "DrinkingwaterSystem", "DrinkingwaterSystem", "DrinkingwaterSystem", "DrinkingwaterSystem", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "SewageTreatmentPlant", "Sediment", "Sediment", "Sediment", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "LiveStock", "Ocean", "Ocean", "Ocean")
pdf("teststagetwoout.16S.pdf")
vd <- vegdist(mothertable,method="bray")
vd.pco <- pco(vd, k=10)
pcoadata <- data.frame(vd.pco$points[,1], vd.pco$points[,2], cols)
EnvironmentType <- pcoadata$cols
pc1n <- vd.pco$eig[1]/sum(vd.pco$eig)
pc2n <- vd.pco$eig[2]/sum(vd.pco$eig)
xl <- paste("Pco1(",(pc1n*10000)%/%100,"%)",sep="")
yl <- paste("Pco2(", (pc2n*10000)%/%100,"%)",sep="")
p <- ggplot(pcoadata, aes(x=pcoadata$vd.pco.points...1., y=pcoadata$vd.pco.points...2., color=EnvironmentType)) + geom_point(size=5,alpha=.8)
p+theme(legend.position=c(0.2,0.8), panel.border = element_blank(), panel.grid.major = element_blank(), panel.background = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), legend.background = element_rect(fill=alpha('white', 0.2)) ) + labs(fill="Samples Type") + xlab(xl) + ylab(yl)
dev.off()
mothertable <- read.table(file="teststagetwoout.normalize_cellnumber.mergesubtype.tab.txt", sep="\t",header=T,row.names=1,quote = "", stringsAsFactors = FALSE)
#remove zero line
mothertable <- mothertable[which(rowSums(mothertable)!=0),]
mothertable <- t(mothertable)
mothertable <- mothertable[which(rowSums(mothertable)!=0),]
dim(mothertable)
pdf("teststagetwoout.cell.pdf")
vd <- vegdist(mothertable,method="bray")
vd.pco <- pco(vd, k=10)
pcoadata <- data.frame(vd.pco$points[,1], vd.pco$points[,2], cols)
EnvironmentType <- pcoadata$cols
pc1n <- vd.pco$eig[1]/sum(vd.pco$eig)
pc2n <- vd.pco$eig[2]/sum(vd.pco$eig)
xl <- paste("Pco1(",(pc1n*10000)%/%100,"%)",sep="")
yl <- paste("Pco2(", (pc2n*10000)%/%100,"%)",sep="")
p <- ggplot(pcoadata, aes(x=pcoadata$vd.pco.points...1., y=pcoadata$vd.pco.points...2., color=EnvironmentType)) + geom_point(size=5,alpha=.8)
p+theme(legend.position=c(0.2,0.8), panel.border = element_blank(), panel.grid.major = element_blank(), panel.background = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), legend.background = element_rect(fill=alpha('white', 0.2)) ) + labs(fill="Samples Type") + xlab(xl) + ylab(yl)
dev.off()
