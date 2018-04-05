# install.packages('vcfR')
library(vcfR)
vcf = read.vcfR("../../Data/ensemble-pon-pass-test.vcf")
vcf.df <- cbind(as.data.frame(getFIX(vcf)), INFO2df(vcf))
View(vcf.df)

filter1 <- dplyr::filter(vcf.df, as.integer(QUAL) > '150')
View(filter1)

#the following line does not work. I wanted to return rows in QUAL columns 
#that are either equal to 0 or 150 m
filter2 <- dplyr::filter(vcf.df, as.integer(QUAL) %in% c("0", "150"))

filter2 <- dplyr::filter(vcf.df, as.integer(QUAL) > '150' | as.integer(QUAL == '0'))
View(filter2)

#Learning Pipe

library(magrittr)
foo_foo <- little_bunny()


