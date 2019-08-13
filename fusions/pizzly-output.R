# given a pizzly *fusions.fasta file, give chr + bp coordinates for fusion

library(Biostrings)
fusions <- c("chrom1","base1","chrom2","base2")
fastaFile <- fasta.index("~/Documents/UMCCR/data/fusions/comparison/MH17T001P013-oncofuse-test.fusions.fasta")
#fastaFileSplit <- unlist(strsplit(fastaFile$desc[1], "_"))
fastaFileSplits <- strsplit(fastaFile$desc, "_")
library(httr)
library(jsonlite)
library(xml2)
server <- "https://grch37.rest.ensembl.org/"

for (i in 1:length(fastaFileSplits)) {
  fastaFileSplit <- fastaFileSplits[i]
  coords <- unlist(strsplit(unlist(fastaFileSplit)[2], ":"))
  if(coords[1] ==0){coords[1] <- 1}
  cdnalookup <- paste(unlist(fastaFileSplit)[1], "/", coords[1], "..", coords[2], sep="")
  ext <- paste("map/cdna/",cdnalookup,"?",sep="")
  r <- GET(paste(server, ext, sep = ""), content_type("application/json"))
  stop_for_status(r)
  fromJSON(toJSON(content(r)))
  locationsA <-fromJSON(toJSON(content(r)))
  as.data.frame(locationsA)[1,c(3,2)]

  coords <- unlist(strsplit(unlist(fastaFileSplit)[4], ":"))
  #coords <- unlist(strsplit(fastaFileSplit[4],":"))
  #coords <- unlist(strsplit(unlist(fastaFileSplit[i])[4],":"))[1]
  if(coords[1] ==0){coords[1] <- 1}
  cdnalookup <- paste(unlist(fastaFileSplit)[1], "/", coords[1], "..", coords[2], sep="")
  ext <- paste("map/cdna/",cdnalookup,"?",sep="")
  r <- GET(paste(server, ext, sep = ""), content_type("application/json"))
  stop_for_status(r)
  fromJSON(toJSON(content(r)))
  locationsB <-fromJSON(toJSON(content(r)))

  #paste(as.data.frame(locationsA)[1,3], as.data.frame(locationsA)[1,2], as.data.frame(locationsB)[1,3], as.data.frame(locationsB)[1,2], sep="\t")
  fusion <- paste(as.data.frame(locationsA)[1,3], as.data.frame(locationsA)[1,2], as.data.frame(locationsB)[1,3], as.data.frame(locationsB)[1,2], sep=",")
  fusions <- rbind(fusions, fusion)
}
write.csv(fusions, file="pizzly_fusions.csv")
