# load packages & import data
library(tidyverse)
tidy_users <- read_csv("./datasets/tidy_users.csv")

# Problem 1... 
#   1a: Filter the data so that we only retain rows
#       for dates with more than 200 users
#   1b: Select the Date and Users variables only
#   1c: Arrange the output to sort the rows by User,
#       in descending order 

output1 <- tidy_users %>% 
  filter( Users > 200 ) %>% 
  select( Date, Users ) %>%
  arrange( -Users )

print(output1)


# Problem 2...
#
# Filter the data so that we only include data from 
# Saturdays with more than 50 users; and arrange the
# output so that cases are shown in descending order
# of User.

output2 <- tidy_users %>% 
  filter(Weekday == 'Saturday' & Users > 50) %>%
  arrange(-Users)

print(output2)


# Problem 3...
#
# Create a sorted table. Use group_by and summarise
# to calculate the average number of users for every
# day of the week (including weekends!), and then use 
# arrange to sort the weekdays by mean number of users. 

output3 <- tidy_users %>%
  group_by( Weekday ) %>%
  summarise( meanUsers = mean(Users) ) %>% 
  arrange( -meanUsers )

print(output3)


# ... bonus question: How would you exclude weekends?

output4 <- tidy_users %>%
  filter(Weekday != "Saturday" & Weekday != "Sunday") %>%
  group_by( Weekday ) %>%
  summarise( meanUsers = mean(Users) ) %>% 
  arrange( -meanUsers )

print(output4)
