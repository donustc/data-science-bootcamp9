install.packages("tidyverse")
library(tidyverse)

# basic plots
hist(mtcars$mpg)

# analyzing horse power
hist(mtcars$hp)
mean(mtcars$hp)


# Convert number columns to factor
str(mtcars)
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("Auto","Manual"))
# Bar plot
barplot(table(mtcars$am))

# Box plot
boxplot(mtcars$hp)
fivenum(mtcars$hp)

# Box plot 2 Variables
boxplot(mpg ~ am, data = mtcars)

# Scatter Plot
plot(mtcars$hp, mtcars$mpg, pch = 16)
