
# DATA SCIENCE LAB
# Built-in Datasets: iris & mtcars


#
# Load Required Packages


library(dplyr)
library(ggplot2)

####################################################
# IRIS DATASET
####################################################

# Display first four numeric columns
iris[, 1:4]

# Mean of first four numeric columns
sapply(iris[, 1:4], mean)

# Mean Sepal Length for each Species
mean(iris$Sepal.Length[iris$Species == "setosa"])
mean(iris$Sepal.Length[iris$Species == "versicolor"])
mean(iris$Sepal.Length[iris$Species == "virginica"])

# Mean using tapply()
tapply(iris$Sepal.Length, iris$Species, mean)

# Mean Sepal Length using dplyr
iris %>%
  group_by(Species) %>%
  summarise(
    mean_sepal = mean(Sepal.Length)
  )

# First 6 rows
head(iris)

# Filter only Setosa
iris %>%
  filter(Species == "setosa") %>%
  summarise(
    mean_sepal = mean(Sepal.Length)
  )

# First 5 rows
iris %>%
  slice(1:5)

# Select specific columns
iris %>%
  select(Sepal.Length, Species)

# Mean and Standard Deviation by Species
iris %>%
  group_by(Species) %>%
  summarise(
    mean_sl = mean(Sepal.Length),
    mean_sw = mean(Sepal.Width),
    mean_pl = mean(Petal.Length),
    mean_pw = mean(Petal.Width),
    
    sd_sl = sd(Sepal.Length),
    sd_sw = sd(Sepal.Width),
    sd_pl = sd(Petal.Length),
    sd_pw = sd(Petal.Width)
  )

####################################################
# MTCARS DATASET
####################################################

# Display dataset
mtcars

# First 6 rows
head(mtcars)

# Structure
str(mtcars)

# Summary
summary(mtcars)

# Column names
names(mtcars)

# Dimension
dim(mtcars)

####################################################
# HISTOGRAM (Base R)
####################################################

hist(
  mtcars$mpg,
  main = "Histogram of MPG",
  xlab = "Miles Per Gallon (MPG)",
  ylab = "Frequency",
  col = "lightblue",
  border = "black"
)

####################################################
# GGPLOT2
####################################################

# Scatter Plot
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Customized Scatter Plot
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue", size = 3) +
  labs(
    title = "Relationship between Weight and MPG",
    x = "Weight",
    y = "Miles Per Gallon"
  )

# Histogram
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(
    bins = 10,
    fill = "lightblue",
    color = "black"
  )

# Bar Chart
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "orange")

# Iris Scatter Plot
ggplot(iris,
       aes(
         x = Sepal.Length,
         y = Petal.Length,
         color = Species
       )) +
  geom_point(size = 3)

####################################################
# BOXPLOT (Base R)
####################################################

boxplot(
  mtcars$mpg,
  main = "Boxplot of MPG",
  ylab = "Miles Per Gallon",
  col = "lightblue",
  border = "black"
)

####################################################
# BOXPLOT (ggplot2)
####################################################

ggplot(mtcars, aes(y = mpg)) +
  geom_boxplot(
    fill = "lightblue",
    color = "black",
    outlier.color = "red",
    outlier.shape = 19,
    outlier.size = 3
  ) +
  labs(
    title = "Boxplot of MPG with Outliers",
    y = "Miles Per Gallon"
  )

####################################################
# IQR METHOD FOR OUTLIER DETECTION
####################################################

# First Quartile
Q1 <- quantile(mtcars$mpg, 0.25)

# Third Quartile
Q3 <- quantile(mtcars$mpg, 0.75)

# Interquartile Range
IQR_value <- IQR(mtcars$mpg)

# Lower & Upper Bound
Lower_Bound <- Q1 - 1.5 * IQR_value
Upper_Bound <- Q3 + 1.5 * IQR_value

# Display Results
Q1
Q3
IQR_value
Lower_Bound
Upper_Bound

# Display Outliers
outliers <- mtcars$mpg[
  mtcars$mpg < Lower_Bound |
    mtcars$mpg > Upper_Bound
]

outliers