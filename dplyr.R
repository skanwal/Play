library(tidyverse)
library(tidyr)
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

#Changing coloumn names after mutation
msleep %>% select(name, sleep_total:awake) %>% 
  mutate_at(vars(contains("sleep"))  , ~(.*60)) %>% 
  rename_at(vars(contains("sleep")), ~paste0(.,"_min"))

#Adding coloumns with funs() inside mutate function. Funs() add the left arugument in the
#quality to the selection made in the first argument of mutate_at
msleep %>% select(name, sleep_total:awake) %>% 
  mutate_at(vars(contains("sleep")), funs(min = .*60))

#Creating new coloumns using ifelse() conditional
msleep %>% select(name, sleep_total) %>% 
  mutate(sleep_time = ifelse(sleep_total > 10, "long", "short"))

#Evaluating multiple statements in mutate using case_when
msleep %>% select(name, sleep_total) %>% 
  mutate(sleep_total_discr = case_when(
    sleep_total>13 ~ "very long",
    sleep_total>10 ~ "long",
    sleep_total>7 ~ "limited",
    TRUE ~ "short")) %>% 
  mutate(sleep_total_discr = factor(sleep_total_discr, levels = c("short", "limited",
                                                                  "long", "very long")))
  
#Splitting and merging coloumns
conservation_expl <- read_csv("conservation_explanation.csv") %>%
  conservation_table <- conservation_expl %>%
  separate(`conservation abbreviation`,
           into = c("abbreviation", "description"), sep = "=")


  
  
  


