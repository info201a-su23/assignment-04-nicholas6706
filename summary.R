#load libraries
library(dplyr)
library(readr)

#read data
washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

#find average jail rate in 2018 overall
avg_jail_2018 <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(total_jail_pop_rate)) %>%
  pull(mean)

#find average Black jail rate in 2018
avg_jail_2018_black <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(black_jail_pop_rate)) %>%
  pull(mean)

#find average White jail rate in 2018
avg_jail_2018_white <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(white_jail_pop_rate)) %>%
  pull(mean)

#find maximum Black jail rate in 2018
max_jail_rate_black <- washington %>%
  filter(year == 2018) %>%
  filter(black_jail_pop_rate == max(black_jail_pop_rate, na.rm = TRUE)) %>%
  pull(black_jail_pop_rate)

#find maximum White jail rate in 2018
max_jail_rate_white <- washington %>%
  filter(year == 2018) %>%
  filter(white_jail_pop_rate == max(white_jail_pop_rate, na.rm = TRUE)) %>%
  pull(white_jail_pop_rate)

#count rows
wa_observations <- nrow(washington)

#count columns
wa_features <- ncol(washington)
