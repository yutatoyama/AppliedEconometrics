

3 < 42

3 > 42

3 == 42
3 == 3
x = 3
y = 3
x == y

# OR
(3 > 42) | (x == y)

# AND
(3 > 42) & (x == y)

# Vectoralization
x = c(1, 3, 5, 7, 8, 9)

x > 3

x != 3
x == 5
x == 10

# Subsetting
x[x > 3]
x[1]
x[c(TRUE, FALSE, FALSE, TRUE, FALSE, TRUE)]

# Matrix

x = 1:9
X = matrix(x, nrow = 3, ncol = 3)
X
Y = matrix(x, nrow = 3, ncol = 3,
           byrow = TRUE)

Z = matrix(0, 2, 4)
Z1 = matrix(1, 4, 2)
Z1


# Subsetting
X
X[1,2]
X[1, ]
X[ ,3]

# rbind
x = 1:9
y = rep(1, 9)

XX = rbind(x, y)
XX

YY = cbind(x, y)
YY

# Calculation of matrix

x = 1:9
y = 9:1
X = matrix(x, 3, 3)
Y = matrix(y, 3, 3)

# Add
X + Y

# Subtract
X - Y

# Multiplication (element-by-element)
X * Y

# Division (element-by-element)
X / Y

# Matrix multiplication
X %*% Y

# Transpose (転置)
t(X)

# Inverse matrix
Z = matrix(c(9, 2, -3, 2, 4, -2, -3, -2, 16), 3, byrow = TRUE)
Z
solve(Z)

# To see whether this returns identity matrix
Z %*% solve(Z)

# If/else

x = 1
y = 10

if (x > y) {
  z = x * y
  print("x is larger than y")
} else if (x == y){z
  z = 1000
  print("x is the same as y")
} else {
  z = x + 5 * y
  print("x is less than or equal to y")
}

# For loop
x = 11:15
for (i in 1:5) {
  x[i] = x[i] * 2
}
x

x = 11:15
x = 2*x

# loop
x = seq(1,10000000, 1)

tt = proc.time()
for (i in 1:10000000){
  x[i] = x[i] * 2
}
proc.time() - tt

t2 = proc.time()
x = seq(1,10000000, 1)
x = 2*x
proc.time() - t2

# Function

standardize = function(x) {
  m = mean(x)
  std = sd(x)
  result = (x - m) / std
  return(result)
}

x = rnorm(20, mean = 1, sd = 3)

standardize(x)

x2 = x / 10
standardize(x2)






















