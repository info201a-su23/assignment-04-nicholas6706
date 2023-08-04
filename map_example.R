library(ggplot2)
library(maps)
library(mapdata)
library(dplyr)


washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

washington <- washington %>%
  filter(year == max(year))

wa_counties <- map_data("county", region = "washington")
wa_counties <- wa_counties %>%
  mutate(subregion = str_to_title(subregion) %>% str_c(" County"))

merged_data <- left_join(wa_counties, washington, by = c("subregion" = "county_name"))

ggplot(data = merged_data, aes(x = long, y = lat, group = group, fill = black_jail_pop_rate)) +
  geom_polygon() +
  coord_fixed(1.2) +
  labs(title = "Black Jail Rate per 100,000 Across Washington Counties",
       fill = "Black Jail Rate") +
  scale_fill_gradient(name = "Black Jail Rate", 
                      low = "lightblue", high = "darkblue",
                      breaks = seq(min(merged_data$black_jail_pop_rate), max(merged_data$black_jail_pop_rate), length.out = 5)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text = element_blank(),
        axis.title = element_blank())
