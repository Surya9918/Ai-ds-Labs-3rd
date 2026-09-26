# Set plot layout to 1 row, 2 columns
par(mfrow = c(1, 2))

# 1. Histogram (shows distribution shape & skew)
hist(mtcars$mpg,
     main = "Histogram of MPG",
     xlab = "Miles per Gallon",
     col = "lightblue",
     border = "white")

# 2. Boxplot (shows median, quartiles, & extreme limits)
boxplot(mtcars$mpg,
        main = "Boxplot of MPG",
        ylab = "Miles per Gallon",
        col = "lightgreen")

# Reset graphics layout
par(mfrow = c(1, 1))