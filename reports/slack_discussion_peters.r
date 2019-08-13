
# bcftools query -H -f '%CHROM\t%INFO/BPI_START\t%INFO/BPI_END\t%INFO/BPI_AF\t%ID\t%INFO/MATEID\t%INFO/SVTYPE\t%FILTER[\t%PR][\t%SR]\n' SFRC01085__PRJ180621_SFRC01085-1MT-sv-prioritize-manta-filter.vcf  > SF1085.tsv


##FORMAT=<ID=PR,Number=.,Type=Integer,Description="Spanning paired-read support for the ref and alt alleles in the order listed">
##FORMAT=<ID=SR,Number=.,Type=Integer,Description="Split reads for the ref and alt alleles in the order listed, for reads where P(allele|read)>0.999">

v <- readr::read_tsv("SF1085.tsv", col_types = "ciiccccccccc", na = ".")
colnames(v)
colnames(v) <- c("chrom", "start", "end", "af", "id", "mateid", "sv_type", "filter",
                "pr_norm", "pr_tum", "sr_norm", "sr_tum")

v %>% 
  tidyr::separate(af, into = c("af1", "af2"), sep = ",", convert = TRUE) %>% 
  tidyr::separate(pr_norm, into = paste0("pr_norm_", c("ref", "alt")), sep = ",", convert = TRUE) %>% 
  tidyr::separate(pr_tum, into = paste0("pr_tum_", c("ref", "alt")), sep = ",", convert = TRUE) %>% 
  tidyr::separate(sr_norm, into = paste0("sr_norm_", c("ref", "alt")), sep = ",", convert = TRUE) %>% 
  tidyr::separate(sr_tum, into = paste0("sr_tum_", c("ref", "alt")), sep = ",", convert = TRUE)
  