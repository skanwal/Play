library(tidyverse)

#check mpg dataframe found in ggplot2
mpg

#plot miles per gallon (mpg) data
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

#display number of rows and columns in mpg
nrow(mpg)
ncol(mpg)

#scatter plot of displ vs hwy
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#plot using aplha aesthetic
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#plot using shape aesthetic aesthetic
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#which variables in mpg are categorical? Which variables are continuous?
sapply(mpg, class)

#