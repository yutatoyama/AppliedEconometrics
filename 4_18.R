
x = 1:10
x + 1

log(x)

#
2 ^ x

# Vectoralization vs forloop

x <- seq(1, 1000000)

tt1 = proc.time()
y <- log(x)
proc.time() - tt1

# Use for loop
tt2 = proc.time()
y <- numeric(1000000)
for ( i in 1:1000000){
  y[i] <- log(x[i])
}
proc.time() - tt2

# logical operator

x <- 10
y <- 11

# x is larger than y
x > y

# x is lower than
x < y

# x is equal to y
x == y

# Difference between "=" and "=="
z = 10
z == 10

# Vectoralized
x = c(1, 3, 5, 7, 8, 9)
(x < 8)

# If/else

x = 4
y = 1

if (x > y) {
  z = x * y
  print("x is larger than y")
} else {
  z = x + 5 * y
  print("x is less than or equal to y")
}

#

if (x > y) {
  z = x * y
} else {
  z = x + 5 * y
}

#
x[1] = x[1]*2
x[2] = x[2]*2
x[3] = x[3]*2
x[4] = x[4]*2
x[5] = x[5]*2

x = 11:15
for (i in 1:5) {
  x[i] = x[i] * 2
}

# Define function

standardize = function(x) {
  m = mean(x)
  std = sd(x)
  result = (x - m) / std
  return(result)
}

test_sample = rnorm(n = 10, mean = 2, sd = 5)
test_sample

standardize(test_sample)















