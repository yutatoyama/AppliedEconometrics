---
output:
  pdf_document: default
  html_document: default
---

# Introduction to the course


## What is econometrics?

1. Estimating economic relationships
    1. Demand curve $\log(Q_{t})= \alpha_0 + \alpha_1 P_t + \epsilon_t$
    2. Production function $Y_{it}=A_{it}K_{it}^{\alpha}L_{it}^{\beta}$
2. Testing economic theory
    - Does adverse selection exists in insurance markets?
    - Are consumers rational?
3. Determine the effect of a given intervention (causal inference)
    - What is the effect of increasing minimum wage on employment?
    - Do mergers increase the output price?
    - Does democracy cause economic growth? (a series of works by Acemoglu, Robinsohn, and their co-authors).
    - Effects of going to private colleges on your future earnings.
    - Note: Some questions may have underlying economic models, others may not. 
4. Describe the data (prediction/forecasting)
    - How does the distribution of wage look like? 
    - Relationship between electricity consumption and temperature (possibly nonlinear).
    - Related to machine learning (ML). 


## Why do we need to learn computation 

1. Conduct statistical and empirical analysis using your own data set
    1. Construct the data set
    2. Describe the data
    3. Run regression or estimate an economic object
    4. Make tables and figures that show the results of your analysis.
    
2. Verify the econometric theory through numerical simulations.
    - Ex. Asymptotic theory considers the case when the sample size is large enough (i.e., $N \rightarrow \infty$) 
        - Law of large numbers, central limit theorem
        - How well is the asymptotic approximation? 
    - **Monte Carlo simulations**

- We will learn both aspects in this course.

## Why do we use R? 

- Many alternatives: Stata, Matlab, Python, etc...
1. Free software!!
    - Stata and Matlab are expensive.
    - Though you can use Matlab through the campus license from this April.
2. Good balance between flexibility in programming and easy-to-use for econometric analysis
    - Stata is easy to use for econometric analysis, but hard to write your own program.
    - Matlab is the opposite. 
    - You can do everything with R, including data construction, regression analysis, and complicated structural estimation.
3. Many users
    - Popular in engineering. 
    - Many packages being developed (especially important for recently popular tools. )
    
- Note: Python seems also good, though I have not used it before.


# Introduction of `R` and `R studio`


## Getting Started 

- You can use R/R studio in the PC room. 
- However, I strongly recommend you install R/Studio in your laptop and bring it to the class. 
- Install in the following order
    1. R: https://www.r-project.org/
    2. Rstudio:  https://www.rstudio.com/
- Now open Rstudio.

## Helps

- The RStudio team has developed [a number of "cheatsheets"](https://www.rstudio.com/resources/cheatsheets/){target="_blank"} for working with both `R` and RStudio.
- [This particular cheatsheet for Base `R`](http://www.rstudio.com/wp-content/uploads/2016/05/base-r.pdf){target="_blank"} will summarize many of the concepts in this document.

## Quick tour of Rstudio 

- There are four panels 
    1. Source: Write your own code here. 
    2. Console:
    3. Environment/History: 
    4. Files/Plots/Packages/Help:
- In the Source panel,
    - Write your own code. 
    - Save your code in `.R` file
    - Click `Run` command to run your entire code.
- In the concole panel,
    - After clicking `Run` in the source panel, your code is evaluated.
    - You can directly type your code here to implement. 

## Basic Calculations

To get started, we'll use `R` like a simple calculator.

#### Addition, Subtraction, Multiplication and Division {-}

| Math          | `R`     | Result    |
|---------------|---------|-----------|
| $3 + 2$       | `3 + 2` | 5 |
| $3 - 2$       | `3 - 2` | 1 |
| $3 \cdot2$    | `3 * 2` | 6 |
| $3 / 2$       | `3 / 2` | 1.5 |

#### Exponents  {-}

| Math         | `R`             | Result            |
|--------------|-----------------|-------------------|
| $3^2$        | `3 ^ 2`         | 9         |
| $2^{(-3)}$   | `2 ^ (-3)`      | 0.125      |
| $100^{1/2}$  | `100 ^ (1 / 2)` | 10 |
| $\sqrt{100}$ | `sqrt(100)`     | 10     |

#### Mathematical Constants  {-}

| Math         | `R`             | Result            |
|--------------|-----------------|-------------------|
| $\pi$        | `pi`            | 3.1415927            |
| $e$          | `exp(1)`        | 2.7182818        |

#### Logarithms  {-}

- Note that we will use $\ln$ and $\log$ interchangeably to mean the natural logarithm. 
- There is no `ln()` in `R`, instead it uses `log()` to mean the natural logarithm.

| Math              | `R`                 | Result                |
|-------------------|---------------------|-----------------------|
| $\log(e)$         | `log(exp(1))`       | 1       |
| $\log_{10}(1000)$ | `log10(1000)`       | 3       |
| $\log_{2}(8)$     | `log2(8)`           | 3           |
| $\log_{4}(16)$    | `log(16, base = 4)` | 2 |

#### Trigonometry  {-}

| Math            | `R`           | Result          |
|-----------------|---------------|-----------------|
| $\sin(\pi / 2)$ | `sin(pi / 2)` | 1 |
| $\cos(0)$       | `cos(0)`      | 1      |

## Getting Help

- In using `R` as a calculator, we have seen a number of functions: `sqrt()`, `exp()`, `log()` and `sin()`. 
- To get documentation about a function in `R`, simply put a question mark in front of the function name and RStudio will display the documentation, for example: 


```r
?log
?sin
?paste
?lm
```


## Installing Packages

- One of the main strengths of `R` as an open-source project is its package system. 
- To install a package, use the `install.packages()` function. 
    - Think of this as buying a recipe book from the store, bringing it home, and putting it on your shelf.


```r
install.packages("ggplot2")
```

- Once a package is installed, it must be loaded into your current `R` session before being used. 
    - Think of this as taking the book off of the shelf and opening it up to read.


```r
library(ggplot2)
```

- Once you close `R`, all the packages are closed and put back on the imaginary shelf. 
- The next time you open `R`, you do not have to install the package again, but you do have to load any packages you intend to use by invoking `library()`.



    
