#required packages
library(tidyverse)

# Do some plots of mosdepth coverage

cov_files <- list.files("path/to/Genome_coverage",full.names = T)

covs <- list()

for (i in 1:length(cov_files)){ 
  
  file <- read.table(cov_files[[i]], header = F, sep = "\t",stringsAsFactors = F)
  colnames(file) <-  c("Chr", "Coverage", "Proportion")
  
  file$Sample <- gsub(".mosdepth.region.dist.txt" ,"", basename(cov_files[[i]]))
  
  covs[[i]] <- file
    
}

chrs <- c(as.character(1:22), "X", "Y", "MT", "total")

bound <- bind_rows(covs)%>%
  mutate(kit = ifelse(grepl("P0|_D|E0",Sample), "RNA-Direct","RNA-Access"))%>%
  mutate(kit = replace(x = kit,list = grepl("FXB|XEN|FRT",Sample),values = "RNA-Access"))%>%
  mutate(kit = replace(x = kit,list = grepl("NEB",Sample),values = "NEB"))%>%
  filter(!grepl("SAMPLE",Sample))%>%
  filter(!grepl("Mel",Sample))%>%
  filter(!grepl("GL",Chr))%>%
  mutate(Chr = factor(Chr,levels = chrs))%>%
  group_by(kit,Chr, Coverage)%>%
  mutate(Overall = mean(Proportion))

to_plot_chrs <- bound %>%
  filter(!grepl("total",Chr))

# Plot per-sample and per-chromosome coverage
ggplot(data = to_plot_chrs, aes(x = Coverage, y = Proportion, colour = kit,fill = Sample))+
  geom_line()+
  facet_wrap(~Chr)+
  labs(x = "Mosdepth coverage" ,y = "Proportion of exonic regions covered")+
  guides(fill= F)+
  xlim(0,100)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        strip.background = element_rect(colour="white", fill="white"),
        legend.title=element_text(size=16),
        legend.text=element_text(size=14),
        axis.text=element_text(size=14),
        axis.title=element_text(size=16,face="bold"),
        legend.key=element_blank(),
        strip.text=element_text(size=16))

# Coverage calcualted by Mosdepth accounting for duplicated reads
ggplot(data = to_plot_chrs, aes(x = Coverage, y = Overall, colour = kit,fill = Sample))+
  geom_line()+
  facet_wrap(~Chr)+
  labs(x = "Mosdepth coverage" ,y = "Proportion of exonic regions covered", coour = "Kit")+
  guides(fill= F)+
  xlim(0,50)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        strip.background = element_rect(colour="white", fill="white"),
        legend.title=element_text(size=16),
        legend.text=element_text(size=14),
        axis.text=element_text(size=14),
        axis.title=element_text(size=16,face="bold"),
        legend.key=element_blank(),
        strip.text=element_text(size=16))+
  ggsave("path/to/Coverage_by_chr_and_kit_close.pdf")

totals <- bound %>%
  filter(Chr == "total")

ggplot(data = totals, aes(x = Coverage, y = Overall, colour = kit,fill = Sample))+
  geom_line()+
  labs(x = "Mosdepth coverage" ,y = "Proportion of exonic regions covered")+
  guides(fill= F)+
  xlim(0,15)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        strip.background = element_rect(colour="white", fill="white"),
        legend.title=element_text(size=16),
        legend.text=element_text(size=14),
        axis.text=element_text(size=14),
        axis.title=element_text(size=16,face="bold"),
        legend.key=element_blank(),
        strip.text=element_text(size=16))+
  ggsave("path/to/Coverage_by_kit_close.pdf")

ggplot(data = totals, aes(x = Coverage, y = Overall, colour = kit,fill = Sample))+
  geom_line()+
  labs(x = "Mosdepth coverage" ,y = "Proportion of exonic regions covered")+
  guides(fill= F)+
  xlim(0,500)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        strip.background = element_rect(colour="white", fill="white"),
        legend.title=element_text(size=16),
        legend.text=element_text(size=14),
        axis.text=element_text(size=14),
        axis.title=element_text(size=16,face="bold"),
        legend.key=element_blank(),
        strip.text=element_text(size=16))+
  ggsave("path/to/Coverage_by_kit_wide.pdf")
