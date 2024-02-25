library(tidyverse)

# histogram
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

# diamonds dataset
diamonds %>%
  count(cut) %>%
  ggplot(data = ., mapping = aes(x = cut)) +
  geom_bar()

# scatter + smooth
base <- ggplot(diamonds %>% 
                 sample_n(1000) %>% 
                 filter(carat <= 2.8),
                aes(x = carat, y = price))

base + 
  theme_minimal() +
  geom_point(alpha = 0.2, color = "red") +
  geom_smooth(method = "loess", se = TRUE) +
  geom_rug()

# add color each cut
ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar() +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")

# scatter with gradient 
ggplot(diamonds %>% 
         sample_frac(0.1),aes(carat, price, color = price)) +
  geom_point(alpha = 0.3) +
  theme_minimal() +
  scale_color_gradient(low = "green", high = "red")

# compare by mpg
m1 <- mtcars %>% filter(mpg > 30)
m2 <- mtcars %>% filter(mpg <= 20)

ggplot() +
  theme_minimal() +
  geom_point(data = m1, aes(wt, mpg), color = "blue") +
  geom_point(data = m2, aes(wt, mpg), color = "red")

# bins 
ggplot(diamonds, aes(carat, price)) +
  geom_bin2d(bins = 50)

# multiple charts
install.packages("patchwork")
library(patchwork)
p1 <- qplot(hwy, data = mpg, geom = "density")
p2 <- qplot(cty, data = mpg, geom = "histogram")
p3 <- qplot(cty, hwy, data = mpg, geom = "point")
p4 <- qplot(cty, hwy, data = mpg, geom = "smooth")

p1 + p2 + p3 + p4

(p1 + p2 + p3) / p4
