# ==========================
# Step 1: Create Data Frame
# ==========================

df <- data.frame(
  Id = c(101, 102, 103, 104),
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(23, 25, 22, 24),
  Score = c(89.5, 76.0, 91.2, 88.8),
  Passed = c(TRUE, FALSE, TRUE, FALSE)
)

print(df)


# ==========================
# Step 2: Add New Column
# ==========================

df$Grade <- c("A", "B", "A+", "A-")

print(df)


# ==========================
# Step 3: Sort by Age
# ==========================

df_sorted <- df[order(df$Age), ]

print(df_sorted)


# ==========================
# Step 4: Sort by Score (Ascending)
# ==========================

df_Scored <- df[order(df$Score), ]

print(df_Scored)


# ==========================
# Step 5: Sort by Id
# ==========================

df_Id <- df[order(df$Id), ]

print(df_Id)


# ==========================
# Step 6: Sort by Score (Descending)
# ==========================

df_desc <- df[order(df$Score, decreasing = TRUE), ]

print(df_desc)


# ==========================
# Step 7: Summary
# ==========================

summary(df)


# ==========================
# Step 8: Structure
# ==========================

str(df)


# ==========================
# Step 9: Convert Age to Character
# ==========================

df$Age <- as.character(df$Age)

print(df)

str(df)


# ==========================
# Step 10: Create List
# ==========================

my_list <- list(
  Name = "Alice",
  Age = 23,
  Score = 89.5
)

print(my_list)


# ==========================
# Step 11: Access List Elements
# ==========================

my_list[2]      # Returns a list

my_list[[2]]    # Returns the value


# ==========================
# Step 12: Function - Add Squares
# ==========================

Add_numbers <- function(a, b) {
  return(a*a + b*b)
}

Add_numbers(5, 3)


# ==========================
# Step 13: Function - Check Even Number
# ==========================

is_even <- function(x) {
  if (x %% 2 == 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

is_even(8)

is_even(7)




