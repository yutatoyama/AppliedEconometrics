
---
output:
  pdf_document: default
  html_document: default
---

# Data and Programming

## Data Types

`R` has a number of basic data *types*.

- Numeric
    - Also known as Double. The default type when dealing with numbers.
    - Examples: `1`, `1.0`, `42.5`
- Logical
    - Two possible values: `TRUE` and `FALSE`
    - You can also use `T` and `F`, but this is *not* recommended.
    - `NA` is also considered logical.
- Character
    - Examples: `"a"`, `"Statistics"`, `"1 plus 2."`

<!-- 
- Integer
    - Examples: `1L`, `2L`, `42L`
- Complex
    - Example: `4 + 2i`
--> 

## Data Structures

- `R` also has a number of basic data *structures*. 
- A data structure is either 
    - homogeneous (all elements are of the same data type) 
    - heterogeneous (elements can be of more than one data type).

| Dimension | **Homogeneous** | **Heterogeneous** |
|-----------|-----------------|-------------------|
| 1         | Vector          | List              |
| 2         | Matrix          | Data Frame        |
| 3+        | Array           |                   |


## Vectors


### Basics of vectors

- Many operations in `R` make heavy use of **vectors**. 
    - Vectors in `R` are indexed starting at `1`. 
- The most common way to create a vector in `R` is using the `c()` function, which is short for "combine."" 


```r
c(1, 3, 5, 7, 8, 9)
```

```
## [1] 1 3 5 7 8 9
```

- If we would like to store this vector in a **variable** we can do so with the **assignment** operator `=`. 
    - The variable `x` now holds the vector we just created, and we can access the vector by typing `x`.


```r
x = c(1, 3, 5, 7, 8, 9)
x
```

```
## [1] 1 3 5 7 8 9
```

```r
# The following does the same thing.
x <- c(1, 3, 5, 7, 8, 9)
x
```

```
## [1] 1 3 5 7 8 9
```

- The operator `=` and `<-` work as an assignment operator. 
    - You can use both. This does not matter usually.
    - If you are interested in the weird cases where the difference matters, check out [The R Inferno](http://www.burns-stat.com/documents/books/the-r-inferno/){target="_blank"}.
- In `R` code the line starting with `#` is `comment`, which is ignored when you run the fode. 
 

<!-- 
Because vectors must contain elements that are all the same type, `R` will automatically coerce to a single type when attempting to create a vector that combines multiple types.


```r
c(42, "Statistics", TRUE)
```

```
## [1] "42"         "Statistics" "TRUE"
```

```r
c(42, TRUE)
```

```
## [1] 42  1
```
-->

- A vector based on a sequence of numbers. 
- The quickest and easiest way to do this is with the `:` operator, which creates a sequence of integers between two specified integers.


```r
(y = 1:100)
```

```
##   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
##  [18]  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
##  [35]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51
##  [52]  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
##  [69]  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85
##  [86]  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100
```

- By putting parentheses around the assignment, 
    - `R` both stores the vector in a variable called `y` and
    - automatically outputs `y` to the console.

### Useful functions for creating vectors

- Use the `seq()` function for a more general sequence.


```r
seq(from = 1.5, to = 4.2, by = 0.1)
```

```
##  [1] 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1
## [18] 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2
```

- Here, the input labels `from`, `to`, and `by` are optional.


```r
seq(1.5, 4.2, 0.1)
```

```
##  [1] 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1
## [18] 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2
```

- The `rep()` function repeat a single value a number of times.


```r
rep("A", times = 10)
```

```
##  [1] "A" "A" "A" "A" "A" "A" "A" "A" "A" "A"
```

- The `rep()` function can be used to repeat a vector some number of times.


```r
rep(x, times = 3)
```

```
##  [1] 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9
```

- We have now seen four different ways to create vectors:
    1. `c()`
    2. `:`
    3. `seq()`
    4. `rep()`

 - They are often used together.


```r
c(x, rep(seq(1, 9, 2), 3), c(1, 2, 3), 42, 2:4)
```

```
##  [1]  1  3  5  7  8  9  1  3  5  7  9  1  3  5  7  9  1  3  5  7  9  1  2
## [24]  3 42  2  3  4
```

- The length of a vector can be obtained with the `length()` function.


```r
length(x)
```

```
## [1] 6
```

```r
length(y)
```

```
## [1] 100
```

### Subsetting

- Use square brackets, `[]`, to obtain a subset of a vector. 
- We see that `x[1]` returns the first element.



```r
x
```

```
## [1] 1 3 5 7 8 9
```

```r
x[1]
```

```
## [1] 1
```

```r
x[3]
```

```
## [1] 5
```

- We can also exclude certain indexes, in this case the second element.


```r
x[-2]
```

```
## [1] 1 5 7 8 9
```

- We can subset based on a vector of indices.


```r
x[1:3]
```

```
## [1] 1 3 5
```

```r
x[c(1,3,4)]
```

```
## [1] 1 5 7
```

- We could instead use a vector of logical values.


```r
z = c(TRUE, TRUE, FALSE, TRUE, TRUE, FALSE)
z
```

```
## [1]  TRUE  TRUE FALSE  TRUE  TRUE FALSE
```


```r
x[z]
```

```
## [1] 1 3 7 8
```

## Vectorization

- One of the biggest strengths of `R` is its use of vectorized operations.    
    - Frequently the lack of understanding of this concept leads of a belief that `R` is *slow*. 
    - `R` is not the fastest language, but it has a reputation for being slower than it really is.)


- When a function like `log()` is called on a vector `x`, a vector is returned which has applied the function to each element of the vector  `x`.


```r
x = 1:10
x + 1
```

```
##  [1]  2  3  4  5  6  7  8  9 10 11
```

```r
2 * x
```

```
##  [1]  2  4  6  8 10 12 14 16 18 20
```

```r
2 ^ x
```

```
##  [1]    2    4    8   16   32   64  128  256  512 1024
```

```r
sqrt(x)
```

```
##  [1] 1.000000 1.414214 1.732051 2.000000 2.236068 2.449490 2.645751
##  [8] 2.828427 3.000000 3.162278
```

```r
log(x)
```

```
##  [1] 0.0000000 0.6931472 1.0986123 1.3862944 1.6094379 1.7917595 1.9459101
##  [8] 2.0794415 2.1972246 2.3025851
```

## Logical Operators

| Operator | Summary               | Example               | Result |
|----------|-----------------------|-----------------------|--------|
| `x < y`  | `x` less than `y`                | `3 < 42`               | TRUE               |
| `x > y`  | `x` greater than `y`             | `3 > 42`               | FALSE               |
| `x <= y` | `x` less than or equal to `y`    | `3 <= 42`              | TRUE              |
| `x >= y` | `x` greater than or equal to `y` | `3 >= 42`              | FALSE              |
| `x == y` | `x`equal to `y`                  | `3 == 42`              | FALSE              |
| `x != y` | `x` not equal to `y`             | `3 != 42`              | TRUE              |
| `!x`     | not `x`                          | `!(3 > 42)`            | TRUE            |
| `x | y`  | `x` or `y`                       | `(3 > 42) | TRUE`      | TRUE      |
| `x & y`  | `x` and `y`                      | `(3 < 4) & ( 42 > 13)` | TRUE |

- Logical operators are vectorized. 


```r
x = c(1, 3, 5, 7, 8, 9)
```


```r
x > 3
```

```
## [1] FALSE FALSE  TRUE  TRUE  TRUE  TRUE
```

```r
x < 3
```

```
## [1]  TRUE FALSE FALSE FALSE FALSE FALSE
```

```r
x == 3
```

```
## [1] FALSE  TRUE FALSE FALSE FALSE FALSE
```

```r
x != 3
```

```
## [1]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
```


```r
x == 3 & x != 3
```

```
## [1] FALSE FALSE FALSE FALSE FALSE FALSE
```

```r
x == 3 | x != 3
```

```
## [1] TRUE TRUE TRUE TRUE TRUE TRUE
```

- This is extremely useful for subsetting.


```r
x[x > 3]
```

```
## [1] 5 7 8 9
```

```r
x[x != 3]
```

```
## [1] 1 5 7 8 9
```


#### Short exercise 

1. Create the vector $z = (1,2,1,2,1,2)$, which has the same length as $x$. 
2. Pick up the elements of $x$ which corresponds to 1 in the vector $z$. 

<!-- 
## More Vectorization


```r
x = c(1, 3, 5, 7, 8, 9)
y = 1:100
```


```r
x + 2
```

```
## [1]  3  5  7  9 10 11
```

```r
x + rep(2, 6)
```

```
## [1]  3  5  7  9 10 11
```


```r
x > 3
```

```
## [1] FALSE FALSE  TRUE  TRUE  TRUE  TRUE
```

```r
x > rep(3, 6)
```

```
## [1] FALSE FALSE  TRUE  TRUE  TRUE  TRUE
```


```r
x + y
```

```
## Warning in x + y: 長いオブジェクトの長さが短いオブジェクトの長さの倍数にな
## っていません
```

```
##   [1]   2   5   8  11  13  15   8  11  14  17  19  21  14  17  20  23  25
##  [18]  27  20  23  26  29  31  33  26  29  32  35  37  39  32  35  38  41
##  [35]  43  45  38  41  44  47  49  51  44  47  50  53  55  57  50  53  56
##  [52]  59  61  63  56  59  62  65  67  69  62  65  68  71  73  75  68  71
##  [69]  74  77  79  81  74  77  80  83  85  87  80  83  86  89  91  93  86
##  [86]  89  92  95  97  99  92  95  98 101 103 105  98 101 104 107
```

```r
length(x)
```

```
## [1] 6
```

```r
length(y)
```

```
## [1] 100
```

```r
length(y) / length(x)
```

```
## [1] 16.66667
```

```r
(x + y) - y
```

```
## Warning in x + y: 長いオブジェクトの長さが短いオブジェクトの長さの倍数にな
## っていません
```

```
##   [1] 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8
##  [36] 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7
##  [71] 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7 8 9 1 3 5 7
```


```r
y = 1:60
x + y
```

```
##  [1]  2  5  8 11 13 15  8 11 14 17 19 21 14 17 20 23 25 27 20 23 26 29 31
## [24] 33 26 29 32 35 37 39 32 35 38 41 43 45 38 41 44 47 49 51 44 47 50 53
## [47] 55 57 50 53 56 59 61 63 56 59 62 65 67 69
```

```r
length(y) / length(x)
```

```
## [1] 10
```


```r
rep(x, 10) + y
```

```
##  [1]  2  5  8 11 13 15  8 11 14 17 19 21 14 17 20 23 25 27 20 23 26 29 31
## [24] 33 26 29 32 35 37 39 32 35 38 41 43 45 38 41 44 47 49 51 44 47 50 53
## [47] 55 57 50 53 56 59 61 63 56 59 62 65 67 69
```


```r
all(x + y == rep(x, 10) + y)
```

```
## [1] TRUE
```

```r
identical(x + y, rep(x, 10) + y)
```

```
## [1] TRUE
```


```r
# ?any
# ?all.equal
```
-->

## Matrices

### Basics

- `R` can also be used for **matrix** calculations. 
  - Matrices have rows and columns containing a single data type. 
  
- Matrices can be created using the `matrix` function. 


```r
x = 1:9
x
```

```
## [1] 1 2 3 4 5 6 7 8 9
```

```r
X = matrix(x, nrow = 3, ncol = 3)
X
```

```
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
```

- We are using two different variables: 
    - lower case `x`, which stores a vector and
    - capital `X`, which stores a matrix. 

- By default the `matrix` function reorders a vector into columns, but we can also tell `R` to use rows instead.


```r
Y = matrix(x, nrow = 3, ncol = 3, byrow = TRUE)
Y
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9
```

- a matrix of a specified dimension where every element is the same, in this case `0`.


```r
Z = matrix(0, 2, 4)
Z
```

```
##      [,1] [,2] [,3] [,4]
## [1,]    0    0    0    0
## [2,]    0    0    0    0
```

- Matrices can be subsetted using square brackets, `[]`. 
- However, since matrices are two-dimensional, we need to specify both a row and a column when subsetting.
- Here we get the element in the first row and the second column. 


```r
X
```

```
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
```

```r
X[1, 2]
```

```
## [1] 4
```

- We could also subset an entire row or column.


```r
X[1, ]
```

```
## [1] 1 4 7
```

```r
X[, 2]
```

```
## [1] 4 5 6
```


- Matrices can also be created by combining vectors as columns, using `cbind`, or combining vectors as rows, using `rbind`.


```r
x = 1:9
rev(x)
```

```
## [1] 9 8 7 6 5 4 3 2 1
```

```r
rep(1, 9)
```

```
## [1] 1 1 1 1 1 1 1 1 1
```


```r
rbind(x, rev(x), rep(1, 9))
```

```
##   [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]
## x    1    2    3    4    5    6    7    8    9
##      9    8    7    6    5    4    3    2    1
##      1    1    1    1    1    1    1    1    1
```

- When using `rbind` and `cbind` you can specify "argument" names that will be used as column names.



```r
cbind(col_1 = x, col_2 = rev(x), col_3 = rep(1, 9))
```

```
##       col_1 col_2 col_3
##  [1,]     1     9     1
##  [2,]     2     8     1
##  [3,]     3     7     1
##  [4,]     4     6     1
##  [5,]     5     5     1
##  [6,]     6     4     1
##  [7,]     7     3     1
##  [8,]     8     2     1
##  [9,]     9     1     1
```

### Matrix calculations

- Perform matrix calculations.


```r
x = 1:9
y = 9:1
X = matrix(x, 3, 3)
Y = matrix(y, 3, 3)
X
```

```
##      [,1] [,2] [,3]
## [1,]    1    4    7
## [2,]    2    5    8
## [3,]    3    6    9
```

```r
Y
```

```
##      [,1] [,2] [,3]
## [1,]    9    6    3
## [2,]    8    5    2
## [3,]    7    4    1
```


```r
X + Y
```

```
##      [,1] [,2] [,3]
## [1,]   10   10   10
## [2,]   10   10   10
## [3,]   10   10   10
```

```r
X - Y
```

```
##      [,1] [,2] [,3]
## [1,]   -8   -2    4
## [2,]   -6    0    6
## [3,]   -4    2    8
```

```r
X * Y
```

```
##      [,1] [,2] [,3]
## [1,]    9   24   21
## [2,]   16   25   16
## [3,]   21   24    9
```

```r
X / Y
```

```
##           [,1]      [,2]     [,3]
## [1,] 0.1111111 0.6666667 2.333333
## [2,] 0.2500000 1.0000000 4.000000
## [3,] 0.4285714 1.5000000 9.000000
```

- Note that `X * Y` is **not** matrix multiplication. 
- It is element by element multiplication. (Same for `X / Y`). 
- Matrix multiplication uses `%*%`. 


- `t()` which gives the transpose of a matrix 


```r
X %*% Y
```

```
##      [,1] [,2] [,3]
## [1,]   90   54   18
## [2,]  114   69   24
## [3,]  138   84   30
```

```r
t(X)
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
## [3,]    7    8    9
```

- `solve()` which returns the inverse of a square matrix if it is invertible.


```r
Z = matrix(c(9, 2, -3, 2, 4, -2, -3, -2, 16), 3, byrow = TRUE)
Z
```

```
##      [,1] [,2] [,3]
## [1,]    9    2   -3
## [2,]    2    4   -2
## [3,]   -3   -2   16
```

```r
solve(Z)
```

```
##             [,1]        [,2]       [,3]
## [1,]  0.12931034 -0.05603448 0.01724138
## [2,] -0.05603448  0.29094828 0.02586207
## [3,]  0.01724138  0.02586207 0.06896552
```

- To verify that `solve(Z)` returns the inverse, we multiply it by `Z`. 
    - We would expect this to return the identity matrix.
    - However we see that this is not the case due to some computational issues. 
    - However, `R` also has the `all.equal()` function which checks for equality, with some small tolerance which accounts for some computational issues.


```r
solve(Z) %*% Z
```

```
##                           [,1]                       [,2]
## [1,] 1.00000000000000000000000 -0.00000000000000006245005
## [2,] 0.00000000000000008326673  1.00000000000000022204460
## [3,] 0.00000000000000002775558  0.00000000000000000000000
##                           [,3]
## [1,] 0.00000000000000000000000
## [2,] 0.00000000000000005551115
## [3,] 1.00000000000000000000000
```

```r
diag(3)
```

```
##      [,1] [,2] [,3]
## [1,]    1    0    0
## [2,]    0    1    0
## [3,]    0    0    1
```

```r
all.equal(solve(Z) %*% Z, diag(3))
```

```
## [1] TRUE
```



#### Exercise

- Solve the following simultanoues equations using matrix calculation
\[
2x_1+3x_2	=10 \\
5x_1+x_2	=20
\]
- Hint: You can write this as $Ax=y$ where A is the 2-times-2 matrix, x and y are vectors with the length of 2. 


### Getting information for matrix

- `R` has a number of matrix specific functions for obtaining dimension and summary information.


```r
X = matrix(1:6, 2, 3)
X
```

```
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
```

```r
dim(X)
```

```
## [1] 2 3
```

```r
rowSums(X)
```

```
## [1]  9 12
```

```r
colSums(X)
```

```
## [1]  3  7 11
```

```r
rowMeans(X)
```

```
## [1] 3 4
```

```r
colMeans(X)
```

```
## [1] 1.5 3.5 5.5
```

- The `diag()` function can be used in a number of ways. We can extract the diagonal of a matrix.


```r
diag(Z)
```

```
## [1]  9  4 16
```

- Or create a matrix with specified elements on the diagonal. (And `0` on the off-diagonals.)


```r
diag(1:5)
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    0    0    0    0
## [2,]    0    2    0    0    0
## [3,]    0    0    3    0    0
## [4,]    0    0    0    4    0
## [5,]    0    0    0    0    5
```

- Or, lastly, create a square matrix of a certain dimension with `1` for every element of the diagonal and `0` for the off-diagonals.


```r
diag(5)
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    0    0    0    0
## [2,]    0    1    0    0    0
## [3,]    0    0    1    0    0
## [4,]    0    0    0    1    0
## [5,]    0    0    0    0    1
```

<!--

#### Calculations with Vectors and Matrices {-}

Certain operations in `R`, for example `%*%` have different behavior on vectors and matrices. To illustrate this, we will first create two vectors.


```r
a_vec = c(1, 2, 3)
b_vec = c(2, 2, 2)
```

Note that these are indeed vectors. They are not matrices.


```r
c(is.vector(a_vec), is.vector(b_vec))
```

```
## [1] TRUE TRUE
```

```r
c(is.matrix(a_vec), is.matrix(b_vec))
```

```
## [1] FALSE FALSE
```

When this is the case, the `%*%` operator is used to calculate the **dot product**, also know as the **inner product** of the two vectors.

The dot product of vectors $\boldsymbol{a} = \lbrack a_1, a_2, \cdots a_n \rbrack$ and $\boldsymbol{b} = \lbrack b_1, b_2, \cdots b_n \rbrack$ is defined to be

\[
\boldsymbol{a} \cdot \boldsymbol{b} = \sum_{i = 1}^{n} a_i b_i = a_1 b_1 + a_2 b_2 + \cdots a_n b_n.
\]


```r
a_vec %*% b_vec # inner product
```

```
##      [,1]
## [1,]   12
```

```r
a_vec %o% b_vec # outer product
```

```
##      [,1] [,2] [,3]
## [1,]    2    2    2
## [2,]    4    4    4
## [3,]    6    6    6
```

The `%o%` operator is used to calculate the **outer product** of the two vectors.

When vectors are coerced to become matrices, they are column vectors. So a vector of length $n$ becomes an $n \times 1$ matrix after coercion.


```r
as.matrix(a_vec)
```

```
##      [,1]
## [1,]    1
## [2,]    2
## [3,]    3
```

If we use the `%*%` operator on matrices, `%*%` again performs the expected matrix multiplication. So you might expect the following to produce an error, because the dimensions are incorrect.


```r
as.matrix(a_vec) %*% b_vec
```

```
##      [,1] [,2] [,3]
## [1,]    2    2    2
## [2,]    4    4    4
## [3,]    6    6    6
```

At face value this is a $3 \times 1$ matrix, multiplied by a $3 \times 1$ matrix. However, when `b_vec` is automatically coerced to be a matrix, `R` decided to make it a "row vector", a $1 \times 3$ matrix, so that the multiplication has conformable dimensions.

If we had coerced both, then `R` would produce an error.


```r
as.matrix(a_vec) %*% as.matrix(b_vec)
```

Another way to calculate a *dot product* is with the `crossprod()` function. Given two vectors, the `crossprod()` function calculates their dot product. The function has a rather misleading name.


```r
crossprod(a_vec, b_vec)  # inner product
```

```
##      [,1]
## [1,]   12
```

```r
tcrossprod(a_vec, b_vec)  # outer product
```

```
##      [,1] [,2] [,3]
## [1,]    2    2    2
## [2,]    4    4    4
## [3,]    6    6    6
```

These functions could be very useful later. When used with matrices $X$ and $Y$ as arguments, it calculates

\[
X^\top Y.
\]

When dealing with linear models, the calculation

\[
X^\top X
\]

is used repeatedly.


```r
C_mat = matrix(c(1, 2, 3, 4, 5, 6), 2, 3)
D_mat = matrix(c(2, 2, 2, 2, 2, 2), 2, 3)
```

This is useful both as a shortcut for a frequent calculation and as a more efficient implementation than using `t()` and `%*%`.


```r
crossprod(C_mat, D_mat)
```

```
##      [,1] [,2] [,3]
## [1,]    6    6    6
## [2,]   14   14   14
## [3,]   22   22   22
```

```r
t(C_mat) %*% D_mat
```

```
##      [,1] [,2] [,3]
## [1,]    6    6    6
## [2,]   14   14   14
## [3,]   22   22   22
```

```r
all.equal(crossprod(C_mat, D_mat), t(C_mat) %*% D_mat)
```

```
## [1] TRUE
```


```r
crossprod(C_mat, C_mat)
```

```
##      [,1] [,2] [,3]
## [1,]    5   11   17
## [2,]   11   25   39
## [3,]   17   39   61
```

```r
t(C_mat) %*% C_mat
```

```
##      [,1] [,2] [,3]
## [1,]    5   11   17
## [2,]   11   25   39
## [3,]   17   39   61
```

```r
all.equal(crossprod(C_mat, C_mat), t(C_mat) %*% C_mat)
```

```
## [1] TRUE
```
-->

## Lists

- A list is a one-dimensional heterogeneous data structure. 
    - It is indexed like a vector with a single integer value, 
    - but each element can contain an element of any type.


```r
# creation
list(42, "Hello", TRUE)
```

```
## [[1]]
## [1] 42
## 
## [[2]]
## [1] "Hello"
## 
## [[3]]
## [1] TRUE
```

```r
ex_list = list(
  a = c(1, 2, 3, 4),
  b = TRUE,
  c = "Hello!",
  d = function(arg = 42) {print("Hello World!")},
  e = diag(5)
)
```

- Lists can be subset using two syntaxes, 
    1. the `$` operator, and 
    2. square brackets `[]`. 

<!--  
- The `$` operator returns a named **element** of a list. 
- The `[]` syntax returns a **list**, 
- `[[]]` returns an **element** of a list.

- `ex_list[1]` returns a list contain the first element.
- `ex_list[[1]]` returns the first element of the list, in this case, a vector.
-->


```r
# subsetting
ex_list$e
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    0    0    0    0
## [2,]    0    1    0    0    0
## [3,]    0    0    1    0    0
## [4,]    0    0    0    1    0
## [5,]    0    0    0    0    1
```

```r
ex_list[1:2]
```

```
## $a
## [1] 1 2 3 4
## 
## $b
## [1] TRUE
```

```r
ex_list[1]
```

```
## $a
## [1] 1 2 3 4
```

```r
ex_list[c("e", "a")]
```

```
## $e
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    0    0    0    0
## [2,]    0    1    0    0    0
## [3,]    0    0    1    0    0
## [4,]    0    0    0    1    0
## [5,]    0    0    0    0    1
## 
## $a
## [1] 1 2 3 4
```

```r
ex_list["e"]
```

```
## $e
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    0    0    0    0
## [2,]    0    1    0    0    0
## [3,]    0    0    1    0    0
## [4,]    0    0    0    1    0
## [5,]    0    0    0    0    1
```

```r
ex_list$d
```

```
## function(arg = 42) {print("Hello World!")}
```

## Data Frames

- We will talk about Dataframe in the next chapter.

## Programming Basics -Control flow-

### if/else

- The if/else syntax is:


```r
if (...) {
  some R code
} else {
  more R code
}
```

- Example: To see whether x is large than y.

```r
x = 1
y = 3
if (x > y) {
  z = x * y
  print("x is larger than y")
} else {
  z = x + 5 * y
  print("x is less than or equal to y")
}
```

```
## [1] "x is less than or equal to y"
```

```r
z
```

```
## [1] 16
```

- `R` also has a special function `ifelse()` 
    - It returns one of two specified values based on a conditional statement.


```r
ifelse(4 > 3, 1, 0)
```

```
## [1] 1
```

- The real power of `ifelse()` comes from its ability to be applied to vectors.


```r
fib = c(1, 1, 2, 3, 5, 8, 13, 21)
ifelse(fib > 6, "Foo", "Bar")
```

```
## [1] "Bar" "Bar" "Bar" "Bar" "Bar" "Foo" "Foo" "Foo"
```
## `for` loop

- A `for` loop repeats the same procedure for the specified number of times


```r
x = 11:15
for (i in 1:5) {
  x[i] = x[i] * 2
}

x
```

```
## [1] 22 24 26 28 30
```

- Note that this `for` loop is very normal in many programming languages.
- In `R` we would not use a loop, instead we would simply use a vectorized operation.
    - `for` loop in `R` is known to be very slow.


```r
x = 11:15
x = x * 2
x
```

```
## [1] 22 24 26 28 30
```

## Functions

- To use a function, 
    - you simply type its name, 
    - followed by an open parenthesis, 
    - then specify values of its arguments, 
    - then finish with a closing parenthesis. 
- An **argument** is a variable which is used in the body of the function. 


```r
# The following is just a demonstration, not the real function in R.
function_name(arg1 = 10, arg2 = 20)
```

- We can also write our own functions in `R`. 
- Example: "standardize" variables
\[
\frac{x - \bar{x}}{s}
\]

- When writing a function, there are three thing you must do.
    1. Give the function a name. Preferably something that is short, but descriptive.
    2. Specify the arguments using `function()`
    3. Write the body of the function within curly braces, `{}`.


```r
standardize = function(x) {
  m = mean(x)
  std = sd(x)
  result = (x - m) / std
  return(result)
}
```

- Here the name of the function is `standardize`, 
- The function has a single argument `x` which is used in the body of function. 
- Note that the output of the final line of the body is what is returned by the function. 


- Let's test our function
- Take a random sample of size `n = 10` from a normal distribution with a mean of `2` and a standard deviation of `5`.


```r
test_sample = rnorm(n = 10, mean = 2, sd = 5)
test_sample
```

```
##  [1]  4.769518  9.563071 12.613792  7.176866  6.775993 15.609376  7.601441
##  [8]  6.005383  3.752943  1.280079
```

```r
standardize(x = test_sample)
```

```
##  [1] -0.65269839  0.48696287  1.21226822 -0.08035441 -0.17566143
##  [6]  1.92446439  0.02058775 -0.35887304 -0.89438772 -1.48230823
```

- The same function can be written more simply.


```r
standardize = function(x) {
  (x - mean(x)) / sd(x)
}
```

- When specifying arguments, you can provide default arguments.


```r
power_of_num = function(num, power = 2) {
  num ^ power
}
```

- Let's look at a number of ways that we could run this function to perform the operation `10^2` resulting in `100`.


```r
power_of_num(10)
```

```
## [1] 100
```

```r
power_of_num(10, 2)
```

```
## [1] 100
```

```r
power_of_num(num = 10, power = 2)
```

```
## [1] 100
```

```r
power_of_num(power = 2, num = 10)
```

```
## [1] 100
```

- Note that without using the argument names, the order matters. The following code will not evaluate to the same output as the previous example.


```r
power_of_num(2, 10)
```

```
## [1] 1024
```

- Also, the following line of code would produce an error since arguments without a default value must be specified.


```r
power_of_num(power = 5)
```

- To further illustrate a function with a default argument, we will write a function that calculates sample variance two ways.

- By default, the function will calculate the unbiased estimate of $\sigma^2$, which we will call $s^2$.

\[
s^2 = \frac{1}{n - 1}\sum_{i=1}^{n}(x - \bar{x})^2
\]

- It will also have the ability to return the biased estimate (based on maximum likelihood) which we will call $\hat{\sigma}^2$.

\[
\hat{\sigma}^2 = \frac{1}{n}\sum_{i=1}^{n}(x - \bar{x})^2
\]


```r
get_var = function(x, unbiased = TRUE) {

  if (unbiased == TRUE){
    n = length(x) - 1
  } else if (unbiased == FALSE){
    n = length(x) 
   }

  (1 / n) * sum((x - mean(x)) ^ 2)
}
```


```r
get_var(test_sample)
```

```
## [1] 17.69145
```

```r
get_var(test_sample, unbiased = TRUE)
```

```
## [1] 17.69145
```

```r
var(test_sample)
```

```
## [1] 17.69145
```

- We see the function is working as expected, and when returning the unbiased estimate it matches `R`'s built in function `var()`. Finally, let's examine the biased estimate of $\sigma^2$.


```r
get_var(test_sample, unbiased = FALSE)
```

```
## [1] 15.92231
```
