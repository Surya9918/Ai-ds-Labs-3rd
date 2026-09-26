install.packages("ggplot2")

library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "steelblue", size = 3) +
  labs(
    title = "Scatter Plot: Weight vs. MPG",
    x = "Weight (1,000 lbs)",
    y = "Miles per Gallon (MPG)"
  ) +
  theme_minimal()