#install Homo sapiens from Bioconductor
source("https://bioconductor.org/biocLite.R")
biocLite("Homo.sapiens")
library(Homo.sapiens)
library(dplyr)
library(DT)

#To get all the gene coordinates, use the genes() function
#genes(TxDb.Hsapiens.UCSC.hg19.knownGene)

#read in input bed file
regions_bed <- read.table("~/Documents/UMCCR/data/mosdepth/CCR180136_WH18F001P025_fakeY_changedthreshold/CCR180136_WH18F001P025.regions.bed", header = FALSE, sep = "\t", stringsAsFactors = FALSE, 
                          col.names=c("chr", "start", "end", "ref", "coverage")) %>%
  mutate(chr=paste0('chr', chr))

#convert genomic coordinates for hotspots to genomic ranges list
regions_bed_gr <- makeGRangesFromDataFrame(regions_bed,
                         keep.extra.columns=FALSE,
                         ignore.strand=TRUE,
                         seqinfo=NULL,
                         seqnames.field="chr",
                         start.field="start",
                         end.field="end",
                         strand.field=NULL,
                         starts.in.df.are.0based=FALSE)



regions_bed <- read.table("~/Documents/UMCCR/data/mosdepth/CCR180136_WH18F001P025_fakeY_changedthreshold/CCR180136_WH18F001P025.regions.bed", header = FALSE, sep = "\t", stringsAsFactors = FALSE, 
                          col.names=c("chr", "start", "end", "ref", "coverage"))

genes <- read.table("~/Documents/UMCCR/data/mosdepth/hotspots/hotspots-ref_alt_genes_uniq_no_chr.bed", header = FALSE, sep = " ", stringsAsFactors = FALSE,
                    col.names = c("chr", "start", "end", "ref_alt", "gene"))

hotspots_genes <- tidyr::separate(genes, col="ref_alt", into=c("ref", "alt"), sep="_", remove=TRUE)

regions_bed_hotspot <- left_join(regions_bed, hotspots_genes) %>%
  dplyr::distinct()


#rearrange columns
regions_bed_hotspot <-regions_bed_hotspot[, c("chr","start", "end", "gene", "ref", "alt", "coverage")]
head(regions_bed_hotspot)

#add callability column to regions.bed file - based on the coverage value
regions_bed_new <- regions_bed_hotspot %>%
  #dplyr::select(coverage) %>%
  dplyr::mutate(callability = case_when(
    coverage == 0 ~ "no_coverage",
    coverage >=1 && coverage <=15 ~ "low_Coverage",
    coverage >=15 && coverage <=500 ~ "callable",
    coverage >=500 ~ "high_coverage"
  ))

DT::datatable(regions_bed_new, rownames = FALSE,
              extensions = c('Scroller', 'Responsive', 'Buttons'), 
              options = list(scroller = TRUE, scrollX = F, scrollY = 500,
                             dom = 'Bfrtip'))

