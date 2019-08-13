library(Biostrings)
library(httr)
library(jsonlite)
library(xml2)


#fusions <- c("chrom1","base1","chrom2","base2")
fusions <- data.frame(matrix(ncol = 4, nrow = 0))
x <-  c("chrom1","base1","chrom2","base2")
colnames(fusions) <- x

tsvFile <- as.data.frame(read.table("~/Documents/UMCCR/data/fusions/pizzly-validation/grolar/CCR170057/CCR170057_AH17T001P001_RNAseqReport.txt",
                      header = TRUE))

#fastaFileSplit <- unlist(strsplit(fastaFile$desc[1], "_"))
tsvFileSplits <- strsplit(as.character(tsvFile$transcripts.list), "_")

server <- "https://grch37.rest.ensembl.org/"

for (i in 1:length(tsvFileSplits)) {
  tsvFileSplit <- tsvFileSplits[i]
  coords <- unlist(strsplit(unlist(tsvFileSplit)[2], ":"))
  if(coords[1] ==0){coords[1] <- 1}
  cdnalookup <- paste(unlist(tsvFileSplit)[1], "/", coords[1], "..", coords[2], sep="")
  ext <- paste("/map/cdna/",cdnalookup,"?",sep="")
  r <- GET(paste(server, ext, sep = ""), content_type("application/json"))
  stop_for_status(r)
  head(fromJSON(toJSON(content(r))))
  locationsA <-fromJSON(toJSON(content(r)))
  as.data.frame(locationsA)[1,c(3,2)]
  
  coords <- unlist(strsplit(unlist(tsvFileSplit)[4], ":"))
  #coords <- unlist(strsplit(fastaFileSplit[4],":"))
  #coords <- unlist(strsplit(unlist(fastaFileSplit[i])[4],":"))[1]
  if(coords[1] ==0){coords[1] <- 1}
  cdnalookup <- paste(unlist(tsvFileSplit)[1], "/", coords[1], "..", coords[2], sep="")
  ext <- paste("map/cdna/",cdnalookup,"?",sep="")
  r <- GET(paste(server, ext, sep = ""), content_type("application/json"))
  stop_for_status(r)
  fromJSON(toJSON(content(r)))
  locationsB <-fromJSON(toJSON(content(r)))
  
  #paste(as.data.frame(locationsA)[1,3], as.data.frame(locationsA)[1,2], as.data.frame(locationsB)[1,3], as.data.frame(locationsB)[1,2], sep="\t")
  #fusion <-c(as.data.frame(locationsA)[1,1], as.data.frame(locationsA)[1,2], as.data.frame(locationsB)[1,3], as.data.frame(locationsB)[1,2], sep=",")
  fusion <- c(locationsA$mappings[1,'seq_region_name'], locationsA$mappings[1,"start"], locationsB$mappings[1,'seq_region_name'], locationsB$mappings[1,'start'])
  #fusions <- rbind.data.frame(fusions, as.data.frame(fusion))
  fusions[nrow(fusions)+1, ] <- fusion
}
write.csv(fusions, file="pizzly_fusions.csv", row.names = FALSE)
