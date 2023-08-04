library(dplyr)
library(readr)
washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

avg_jail_2018 <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(total_jail_pop_rate)) %>%
  pull(mean)

avg_jail_2018_black <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(black_jail_pop_rate)) %>%
  pull(mean)

avg_jail_2018_white <- washington %>%
  filter(year == 2018) %>%
  summarise(mean = mean(white_jail_pop_rate)) %>%
  pull(mean)

max_jail_rate_black <- washington %>%
  filter(year == 2018) %>%
  filter(black_jail_pop_rate == max(black_jail_pop_rate, na.rm = TRUE)) %>%
  pull(black_jail_pop_rate)

max_jail_rate_white <- washington %>%
  filter(year == 2018) %>%
  filter(white_jail_pop_rate == max(white_jail_pop_rate, na.rm = TRUE)) %>%
  pull(white_jail_pop_rate)

wa_observations <- nrow(washington)

wa_features <- ncol(washington)
