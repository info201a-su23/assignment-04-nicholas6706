x_values <- seq(1, 20000)
y_values <- seq(1,3)

library(ggplot2)
washington <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")
washington <- na.omit(washington)


ggplot(washington, aes(x = black_jail_pop_rate, y = black_prison_pop_rate)) +
  geom_point() +
  labs(title = "2018 Black Jail vs Prison Population",
       x = "Black Jail Population",
       y = "Black Prison Populationl") +
  theme_minimal() +
  xlim(0,15000)
