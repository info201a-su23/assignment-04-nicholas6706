#load libraries
library(ggplot2)
library(dplyr)
library(readr)

#load data
washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

#aggregate data to find average rate per year
aggregate_black_avg <- aggregate(black_jail_pop_rate ~ year, data = washington, FUN = mean)
aggregate_white_avg <- aggregate(white_jail_pop_rate ~ year, data = washington, FUN = mean)
avg_jail_pop <- aggregate_black_avg %>%
  full_join(aggregate_white_avg, by = "year")

#plot chart
ggplot(avg_jail_pop, aes(x = year)) +
  geom_line(aes(y = black_jail_pop_rate, color = "blue"), linewidth = 1.2) +
  geom_line(aes(y = white_jail_pop_rate, color = "red"), linewidth = 1.2) +
  theme_minimal() +
  labs(title = "Average Black and White Jail Population from 1990-2018",
       y = "Jail Population",
       x = "Year") +
  scale_color_manual(values = c("red", "blue"), labels = c("Black Population", "White population"), guide = guide_legend(title = "Race"))
