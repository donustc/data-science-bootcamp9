## nycflights13 dataset
library(nycflights13)
library(tidyverse)

## ask 5 questions about this dataaset
data("flights")
data("airlines")

## which month has the highest number of flight
flights %>% 
  group_by(month) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

## the fastest flight
flights %>% 
  select(month, day, origin, dest) %>% 
  mutate(mile_per_min = flights$distance/flights$air_time) %>% 
  arrange(desc(mile_per_min))

##which carrier has the highest delay time
df <- flights %>%
  replace_na(replace = list(dep_delay = 0, 
                            arr_delay = 0))
df %>% 
  group_by(carrier) %>%
  summarise(sum_dep_dalay = sum(arr_delay),
            sum_arr_delay = sum(dep_delay)) %>% 
  mutate(total_delay = sum_dep_dalay + sum_arr_delay)
