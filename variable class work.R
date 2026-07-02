# ==========================
# Step 1: Variables
# ==========================

a <- 2
a

b <- 3

c <- a + b
d <- a + b

5 + 5

e <- 10
f <- 5

e + f

x <- 20
y <- 10

x - y


# ==========================
# Step 2: Create Vector
# ==========================

vec1 <- c(10, 11, 12, 13, 14, 20)

vec2 <- c(20, 21, 22, 23, 25, 30)


# ==========================
# Step 3: Vector Addition
# ==========================

sum_vec <- vec1 + vec2
vec3 <- vec1 + vec2

print(sum_vec)
print(vec3)


# ==========================
# Step 4: Character Vector
# ==========================

vec5 <- c("tanim", "karim", "jannat")


# ==========================
# Step 5: Access Elements
# ==========================

vec2[3]          # 3rd value

vec2[c(2,3)]     # 2nd and 3rd value

vec2[c(3,4)]     # 3rd and 4th value

vec2[2:5]        # 2nd to 5th value

1:5


# ==========================
# Step 6: Modify Elements
# ==========================

vec2[3] <- 100

vec2[c(3,4)] <- c(300, 400)

print(vec2)


# ==========================
# Step 7: Filter Values
# ==========================

vec2 <- vec2[vec2 > 10]

print(vec2)

vec2 > 10


# ==========================
# Step 8: New Vector
# ==========================

vec1 <- c(5, 10, 11, 20, 3, 15)

vec2 <- vec1[vec1 > 10]

print(vec2)


# ==========================
# Step 9: Add New Values
# ==========================

vec2 <- c(vec2, 40, 50)

print(vec2)

vec1[7:8] <- c(40, 50)

print(vec1)


# ==========================
# Step 10: Vector Functions
# ==========================

length(vec2)

sum(vec2)

min(vec2)

mean(vec2)

median(vec2)

var(vec2)

sd(vec2)
