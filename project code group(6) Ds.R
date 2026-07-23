
           # Introduction to Data Science Project
          # Dataset: Student Performance Factors


# Load Library

library(readr)

# Import Dataset

StudentPerformanceFactors <- read_csv("StudentPerformanceFactors.csv")

head(StudentPerformanceFactors)
str(StudentPerformanceFactors)
dim(StudentPerformanceFactors)
names(StudentPerformanceFactors)
summary(StudentPerformanceFactors)

# Create Working Copy

student_dirty <- StudentPerformanceFactors

# Introduce Missing Values

set.seed(123)

student_dirty$Hours_Studied[sample(1:nrow(student_dirty), 30)] <- NA
student_dirty$Attendance[sample(1:nrow(student_dirty), 25)] <- NA
student_dirty$Previous_Scores[sample(1:nrow(student_dirty), 20)] <- NA

colSums(is.na(student_dirty))

# Introduce Invalid Values

student_dirty$Exam_Score[sample(1:nrow(student_dirty), 10)] <- 150
student_dirty$Sleep_Hours[sample(1:nrow(student_dirty), 8)] <- -5

student_dirty[student_dirty$Exam_Score > 100, ]
student_dirty[student_dirty$Sleep_Hours < 0, ]

# Introduce Duplicate Rows

duplicate_rows <- student_dirty[1:10, ]

student_dirty <- rbind(student_dirty, duplicate_rows)

sum(duplicated(student_dirty))

# Introduce Inconsistent Text Format

student_dirty$Gender[1] <- "male"
student_dirty$Gender[2] <- "MALE"
student_dirty$Gender[3] <- "Male "
student_dirty$Gender[4] <- " FEMALE"

table(student_dirty$Gender)

# Handle Missing Values

student_dirty$Hours_Studied[is.na(student_dirty$Hours_Studied)] <-
  median(student_dirty$Hours_Studied, na.rm = TRUE)

student_dirty$Attendance[is.na(student_dirty$Attendance)] <-
  median(student_dirty$Attendance, na.rm = TRUE)

student_dirty$Previous_Scores[is.na(student_dirty$Previous_Scores)] <-
  median(student_dirty$Previous_Scores, na.rm = TRUE)

colSums(is.na(student_dirty))

# Handle Invalid Values

student_dirty$Exam_Score[student_dirty$Exam_Score > 100] <-
  median(student_dirty$Exam_Score[student_dirty$Exam_Score <= 100])

student_dirty$Sleep_Hours[student_dirty$Sleep_Hours < 0] <-
  median(student_dirty$Sleep_Hours[student_dirty$Sleep_Hours >= 0])

student_dirty[student_dirty$Exam_Score > 100, ]
student_dirty[student_dirty$Sleep_Hours < 0, ]

# Remove Duplicate Rows

sum(duplicated(student_dirty))

student_dirty <- unique(student_dirty)

sum(duplicated(student_dirty))

# Fix Inconsistent Text Format

student_dirty$Gender <- trimws(student_dirty$Gender)

student_dirty$Gender[student_dirty$Gender == "male"] <- "Male"
student_dirty$Gender[student_dirty$Gender == "MALE"] <- "Male"
student_dirty$Gender[student_dirty$Gender == "FEMALE"] <- "Female"

table(student_dirty$Gender)

# Descriptive Statistics

summary(student_dirty)

mean(student_dirty$Exam_Score)
median(student_dirty$Exam_Score)
sd(student_dirty$Exam_Score)

mean(student_dirty$Hours_Studied)
median(student_dirty$Hours_Studied)
sd(student_dirty$Hours_Studied)

# Histogram

hist(student_dirty$Exam_Score,
     main = "Distribution of Exam Scores",
     xlab = "Exam Score",
     col = "lightblue")

# Boxplot

boxplot(student_dirty$Exam_Score,
        main = "Boxplot of Exam Score",
        col = "orange")

# Group Comparison

aggregate(Exam_Score ~ Gender,
          data = student_dirty,
          mean)

boxplot(Attendance ~ Gender,
        data = student_dirty,
        col = c("lightgreen", "lightblue"))

# Filtering

high_score <- subset(student_dirty,
                     Exam_Score > 80)

head(high_score)

# Normalization

student_dirty$Hours_Normalized <-
  (student_dirty$Hours_Studied -
     min(student_dirty$Hours_Studied)) /
  (max(student_dirty$Hours_Studied) -
     min(student_dirty$Hours_Studied))

summary(student_dirty$Hours_Normalized)

# Missing Value Visualization

library(naniar)

gg_miss_var(student_dirty)

# Train Test Split

library(caTools)

set.seed(123)

split <- sample.split(student_dirty$Exam_Score,
                      SplitRatio = 0.8)

train_data <- subset(student_dirty,
                     split == TRUE)

test_data <- subset(student_dirty,
                    split == FALSE)

dim(train_data)
dim(test_data)