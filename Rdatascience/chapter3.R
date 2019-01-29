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

#using facets to display subset of data
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)

#faceting on comination of variables
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

#facet in a staraight line, instead of diving into rows and columns
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ class)

#faceting on a continuous variable - doesn't make sense, is distorted
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ model, nrow = 2)

#display multiple geoms in the sample plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#passing global mappings
ggplot(data = mpg, mapping = aes(x= displ, y = hwy)) +
  geom_point() +
  geom_smooth()

#place aes in both geom functions and global mappings
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

#using different data for each layer of the plot
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "subcompact"), se = TRUE )

#recreate R code for the graphs shown in exercise 3.6
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(aes(group = drv), se = FALSE) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_smooth(aes(group = drv), se = FALSE) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = drv)) +
  geom_smooth(aes(linetype = drv), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 4, colour = "white") + 
  geom_point(aes(colour = drv))

#using statistical transformations from box plots
ggplot(data = diamonds )+
  geom_bar(mapping = aes(x = cut))

#display a bar chart of proportion
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1)) #group="whatever" overrides the default geom_bar behavior
                                                            #of counting whatever is on x-axis. 

#adding statistical transformation to code
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    geom = 'point',
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#position adjustments
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, colour = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))


#exercise 3.8.1
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")

#exercise 3.9.1
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
