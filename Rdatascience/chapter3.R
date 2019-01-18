library(tidyverse)

#check mpg dataframe found in ggplot2
mpg

#plot miles per gallon (mpg) data
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

#display number of rows and columns in mpg
nrow(mpg)
ncol(mpg)

#scatter plot of hwy vs cyl
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))