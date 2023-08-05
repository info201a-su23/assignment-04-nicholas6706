#load packages
library(ggplot2)
library(mapdata)
library(purrr)
library(dplyr)
library(maps)

#load data
washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

#filter data for latest year
washington <- washington %>%
  filter(year == max(year))

#load map_data
wa_counties <- map_data("county", region = "washington")

#changing subregion to match formatting in jail data
wa_counties <- wa_counties %>%
  mutate(subregion = str_to_title(subregion) %>% str_c(" County"))

#combine map_data and jail data
merged_data <- left_join(wa_counties, washington, by = c("subregion" = "county_name"))

#plot map
ggplot(data = merged_data, aes(x = long, y = lat, group = group, fill = black_jail_pop_rate)) +
  geom_polygon() +
  coord_fixed(1.25, ylim = c(min(wa_counties$lat), max(wa_counties$lat))) +
  labs(title = "Black Jail Rate per 100,000 Across Washington Counties",
       fill = "Black Jail Rate") +
  scale_fill_gradient(name = "Black Jail Rate", 
                      low = "lightblue", high = "darkblue",
                      breaks = seq(min(merged_data$black_jail_pop_rate), max(merged_data$black_jail_pop_rate), length.out = 5)) +
  theme_minimal() +
  theme(plot.title = element_text(),
        axis.text = element_blank(),
        axis.title = element_blank())

