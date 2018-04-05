library(tidyverse)
library(vcfR)

#Test file
vcf <-  read.vcfR("../../Data/ensemble-pon-pass-test.vcf")
vcf.df <- cbind(as.data.frame(getFIX(vcf)), INFO2df(vcf))

vcf.df %>% select(POS, ID, REF) %>% glimpse()

#vcf.df %>% select_if(is.numeric) %>% select_if(mean)

glimpse(msleep)

msleep %>% select(name, sleep_total) %>% mutate(sleep_total_minute = sleep_total * 60)

msleep %>% select(name, sleep_total) %>% mutate(sleep_total_vs_avg = sleep_total - round(mean(sleep_total), 1), 
                                                sleep_total_vs_min = sleep_total - min(sleep_total))

