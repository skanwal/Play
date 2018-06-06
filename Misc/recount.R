# Install packages
source("https://bioconductor.org/biocLite.R")
biocLite(c("recount", "GenomicRanges", "DESeq2", "ideal", "regionReport",
           "clusterProfiler", "org.Hs.eg.db", "gplots", "derfinder",
           "rtracklayer", "GenomicFeatures", "bumphunter", "derfinderPlot",
           "devtools"))

# Load packages
library("recount")
library("GenomicRanges")
library("DESeq2")
library("ideal")
library("regionReport")
library("clusterProfiler")
library("org.Hs.eg.db")
library("gplots")
library("derfinder")
library("rtracklayer")
library("GenomicFeatures")
library("bumphunter")
library("derfinderPlot")
library("devtools")

# Gene and exon count matrices we have to process the annotation, which for
# recount2 is Gencode v25 with hg38 coordinates. Although, three different exons. 

exons <- GRanges("seq", IRanges(start = c(1, 1, 13), end = c(5, 8, 15)))
exons
disjoin(exons)
