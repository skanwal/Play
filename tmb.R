library(vcfR)
library(dplyr)
vcf_test = read.vcfR("../../Data/ensemble-pon-pass-test.vcf")
vcf.df <- cbind(as.data.frame(getFIX(vcf_test)), INFO2df(vcf_test))
View(vcf.df)

# Have a named vector with chr + chr_length
# You can extract the chr_length for chr, and then bin based on that
# In a named vector, you can access each element by name
# chr_lengths[chr_you_want]

chr_lengths <- c(249250621L, 243199373L, 198022430L, 191154276L,
                 180915260L, 171115067L, 159138663L, 146364022L,
                 141213431L, 135534747L, 135006516L, 133851895L,
                 115169878L, 107349540L, 102531392L,  90354753L,
                 81195210L,  78077248L,   59128983L,  63025520L,
                 48129895L,  51304566L,  155270560L,  59373566L, 16569L)
chr_names = c(1:22, "X", "Y", "MT")
names(chr_lengths) <- chr_names
chr_lengths["13"]

# testing smaller vcf
#extract chr and pos from vcf and make df from it
chr_pos <- data.frame(chr=getCHROM(vcf_test), pos=getPOS(vcf_test), stringsAsFactors = FALSE)
bins <- seq(from = 0 , to = 10000000, by = 1000000)

pos_binned <- cbind(chr_pos$pos, findInterval(chr_pos$pos, bins))
table(pos_binned[, 2])
mean(table(pos_binned[, 2]))

# running on bigger vcf
vcf_info_tidy <- vcfR::extract_info_tidy(vcf) # gives info in tidy format
vcf_fix_col <- vcfR::getFIX(vcf)
vcf_info_untidy <- vcfR::INFO2df(vcf) # never ends

vcf = read.vcfR("../../Data/ensemble-pon-pass.vcf")
vcf_all <- vcfR::vcfR2tidy(vcf) # gives everything in tidy format
table(vcf_all$gt$Indiv)
vcf_all2 <- vcf_all$fix # extract the 'fix' element from the vcf_all list
chr_pos_all <- data.frame(chr=getCHROM(vcf), pos=getPOS(vcf), stringsAsFactors = FALSE)
table(chr_pos_all$chr)
chr_pos_1 <- dplyr::filter(chr_pos_all, chr == "1")
chr1_length <- chr_lengths["1"]
bin_size <- 40000000
bins_chr1 <- seq(from = 0, to = chr1_length, by = bin_size)
pos_binned_chr1 <- cbind(chr_pos_1$pos, findInterval(chr_pos_1$pos, bins_chr1))
mean(table(pos_binned_chr1[,2]))

# Get chr number
# Filter vcf for that chr
# Take binsize as an argument
# Take chr as an argument

filter_chr <- function(x, vcf) {
  vcf_chr_pos <- data.frame(chr=getCHROM(vcf), pos=getPOS(vcf), stringsAsFactors = FALSE)
  return(filter(vcf_chr_pos, chr == x))
}

bin_chr <- function(chr_lengths, chr_name, bin_size) {
  return(seq(from = 0, to = chr_lengths[chr_name], by = bin_size))
}

bin_chr(chr_lengths, "1", bin_size)

count_mut_in_chr <- function(chr_pos, bin_vec) {
  x <- cbind(chr_pos$pos, findInterval(chr_pos$pos, bin_vec))
  mean(table(x[, 2]))
}

x <- count_mut_in_chr(filter_chr("1", vcf), bin_chr(chr_lengths, "1", bin_size))


# apply same function to all chromosomes
fun1 <- function(arg_name) {
  count_mut_in_chr(filter_chr(arg_name, vcf), bin_chr(chr_lengths, arg_name, bin_size))
}
results <- vector("numeric", length = length(chr_names))
for (i in 1:length(chr_names)) {
  results[i] <- count_mut_in_chr(filter_chr(chr_names[i], vcf), bin_chr(chr_lengths, chr_names[i], bin_size))
}

sapply(chr_names[1:3], fun1)

sapply(c(1, 2, 3), function(arg) {
  arg**2
})

