library(tidyverse)
library(vcfR)

#Test file
vcf <-  read.vcfR("../../Data/ensemble-pon-pass-test.vcf")
vcf.df <- cbind(as.data.frame(getFIX(vcf)), INFO2df(vcf))

vcf.df %>% select(POS, ID, REF) %>% glimpse()

#vcf.df %>% select_if(is.numeric) %>% select_if(mean)

glimpse(msleep)

msleep %>% select(name, sleep_total) %>% mutate(sleep_total_minute = sleep_total * 60)

#Create two new coloumns 
msleep %>% select(name, sleep_total) %>% 
  mutate(sleep_total_vs_avg = sleep_total - round(mean(sleep_total), 1),
  sleep_total_vs_min = sleep_total - min(sleep_total))

#Create column using if else and arrange
msleep %>% select(name, brainwt) %>% 
  mutate(brainwt2 = ifelse(brainwt > 4, NA, brainwt)) %>% 
  arrange(desc(brainwt))

msleep %>% select(name) %>% 
  mutate(name_last_word = tolower(str_extract(name, pattern = "\\w+$")))

#Screw the data
msleep_ohno <- msleep %>% 
  mutate_all(~paste(., "  /n  "))

#Let's clean it now
msleep_corr <- msleep_ohno %>% 
  mutate_all(~str_replace_all(., "/n", "")) %>% 
  mutate_all(str_trim)

#Applying condition to mutate
msleep %>% select(name, sleep_total:bodywt) %>% 
  mutate_if(is.numeric, round)

#Applying mutate to specific coloumns names

msleep %>% select(name, sleep_total:awake) %>% 
  mutate_at(vars(contains("sleep")), ~(.*60))










