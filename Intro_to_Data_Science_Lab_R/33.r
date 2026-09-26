data(iris)
iris_data <- iris

head(iris_data)
tail(iris_data)
str(iris_data)
dim(iris_data)
names(iris_data)
summary(iris_data)

colSums(is.na(iris_data))
anyNA(iris_data)

sum(duplicated(iris_data))
iris_data[duplicated(iris_data), ]

iris_data$Species <- as.factor(iris_data$Species)
levels(iris_data$Species)
table(iris_data$Species)

boxplot(iris_data$Sepal.Length,
        main="Sepal Length", ylab="Length")

boxplot(iris_data$Sepal.Width,
        main="Sepal Width", ylab="Width")

normalize <- function(x) {
  (x-min(x))/(max(x)-min(x))
}

iris_data$Sepal.Length_N <- normalize(iris_data$Sepal.Length)
iris_data$Sepal.Width_N <- normalize(iris_data$Sepal.Width)
iris_data$Petal.Length_N <- normalize(iris_data$Petal.Length)
iris_data$Petal.Width_N <- normalize(iris_data$Petal.Width)

iris_data$Sepal.Length_Z <- as.numeric(scale(iris_data$Sepal.Length))
iris_data$Sepal.Width_Z <- as.numeric(scale(iris_data$Sepal.Width))
iris_data$Petal.Length_Z <- as.numeric(scale(iris_data$Petal.Length))
iris_data$Petal.Width_Z <- as.numeric(scale(iris_data$Petal.Width))

head(iris_data)

# ---------- Outlier detection (statistical way) ----------
# This version uses base R only, so it works without dlookr / pagedown issues.

# 1. IQR method: values outside Q1 - 1.5*IQR and Q3 + 1.5*IQR
for (col in c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")) {
  q1 <- quantile(iris_data[[col]], 0.25, na.rm = TRUE)
  q3 <- quantile(iris_data[[col]], 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower <- q1 - 1.5 * iqr
  upper <- q3 + 1.5 * iqr

  outliers <- subset(iris_data, iris_data[[col]] < lower | iris_data[[col]] > upper)
  cat("\nOutliers in", col, ":\n")
  print(outliers[, c("Species", col)])
}

# 2. Z-score method: absolute z-score > 3 is usually an outlier
iris_data$Sepal_Length_Zscore <- abs(scale(iris_data$Sepal.Length))
outlier_z <- subset(iris_data, Sepal_Length_Zscore > 3)
cat("\nOutliers using Z-score (Sepal.Length):\n")
print(outlier_z[, c("Species", "Sepal.Length", "Sepal_Length_Zscore")])

# 3. Boxplot to visually display outliers
boxplot(iris_data$Sepal.Length ~ iris_data$Species,
        main = "Outliers in Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = c("lightblue", "lightgreen", "lightpink"),
        border = "darkblue")

# 4. A simple summary table of outlier counts
outlier_summary <- data.frame(
  Column = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
  stringsAsFactors = FALSE
)

for (i in seq_len(nrow(outlier_summary))) {
  col <- outlier_summary$Column[i]
  q1 <- quantile(iris_data[[col]], 0.25, na.rm = TRUE)
  q3 <- quantile(iris_data[[col]], 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower <- q1 - 1.5 * iqr
  upper <- q3 + 1.5 * iqr
  count <- sum(iris_data[[col]] < lower | iris_data[[col]] > upper, na.rm = TRUE)
  outlier_summary$count[i] <- count
}

cat("\nOutlier counts using IQR method:\n")
print(outlier_summary)
