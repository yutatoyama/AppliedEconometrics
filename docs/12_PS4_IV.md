---
output:
  pdf_document: default
  html_document: default
---

# Exercise 3 (Problem Set 4)

* Due date: June 18th (Tue) 11pm.

## Rules

- If you are enrolled in Japanese class (i.e., Wednesday 2nd), you can use both Japanese and English to write your answer. 
- Submit your solution through `CourseN@vi`.
- **Important:** Submission format
  - If you use Rmarkdown, please compile your Rmarkdown file into either "html" or "PDF" file and submit **both** the compiled file and a Rmarkdown file. 
  - If you do not use Rmarkdown, please submit the document file that contains your answer and R script file (.R file) **separately**, that is, you submit **two files**.


## Question: Demand Estimation

- You might want to refer [the lecture note](IV_Examples_190524.pdf) in my other class where I covered the same topic. 
- We use the dataset from Stephen Ryan (2012) "The Costs of Environmental Regulation in a Concentrated Industry", Econometrica, Issue 3, 1019-1061, 2012
- This is the data for Portland cement in the US. The data is panel for 22 regions (roughly corresponding to the US state) from 1981 to 1999.
- Ryan (2012) studies the effects of environmental regulation on dynamic competition among cement producers.
- Graduate-level knowledge about econometrics and industrial organization is needed to understand the whole paper. Rather we focus on a part of his analysis, that is demand estimation.

- The dataset is [here](cementDec2009.csv).
- The original dataset contains many variable. Here, we pick a subset of the variable we use in the analysis. 


```r
library(readr)
```

```
## Warning: パッケージ 'readr' はバージョン 3.5.3 の R の下で造られました
```

```r
library(dplyr)
```

```
## 
##  次のパッケージを付け加えます: 'dplyr'
```

```
##  以下のオブジェクトは 'package:stats' からマスクされています: 
## 
##      filter, lag
```

```
##  以下のオブジェクトは 'package:base' からマスクされています: 
## 
##      intersect, setdiff, setequal, union
```

```r
library(stargazer)
```

```
## 
## Please cite as:
```

```
##  Hlavac, Marek (2018). stargazer: Well-Formatted Regression and Summary Statistics Tables.
```

```
##  R package version 5.2.2. https://CRAN.R-project.org/package=stargazer
```

```r
RyanData <- readr::read_csv("cementDec2009.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_double(),
##   region = col_character()
## )
```

```
## See spec(...) for full column specifications.
```

```r
RyanData %>% 
  dplyr::select(year, shipped, price, wage96, coal96, elec96, population, gas96) -> RyanData

stargazer::stargazer(as.data.frame(RyanData), type = "text")
```

```
## 
## =====================================================================================
## Statistic   N       Mean        St. Dev.      Min    Pctl(25)    Pctl(75)     Max    
## -------------------------------------------------------------------------------------
## year       483   1,989.907        5.537      1,981     1,985      1,995      1,999   
## shipped    483   2,850.592      1,575.068     186     1,717.5    3,689.5     10,262  
## price      483     67.935        13.731     39.351    58.644      74.892    138.992  
## wage96     483     31.679         4.377     20.139    28.695      34.475     44.338  
## coal96     483     26.904         8.243     15.880    19.190      34.200     42.330  
## elec96     483     5.706          1.023      4.230     4.750      6.740      7.600   
## population 483 10,297,214.000 7,410,527.000 689,584 4,692,603.0 12,000,000 33,100,000
## gas96      483     6.263          2.266      3.701     5.041      6.810      24.304  
## -------------------------------------------------------------------------------------
```
- The data description

| Name | Description|
|---|-------------------------------------------------------------------|
| shipped | Quantity of cement shipped (measured in thousands of tons per year) |
| price | Price (measured in dollars per ton).   |
| wage96 | wage in dollars per hour for skilled manufacturing workers, and taken from County Business Patterns|
| coal96 | Coal price (dollars per ton)  |
| elec96 | electricity price (dollars per kilowatt hour for electricity) |
| population |  the total populations of the states covered by a regional market. |
| gas96 | Gas price (dollars per thousand cubic feet for gas.) | 

- Note that all price are adjusted to 1996 constant dollars.

### Questions

1. Estimate the demand model for the following two specifications with and without instruments.
$$
\begin{aligned}
\log(Q_{jt}) & = \beta_0 + \beta_1 \log(P_{jt}) + \epsilon_{it} \\ 
\log(Q_{jt}) & = \beta_0 + \beta_1 \log(P_{jt}) + \beta_2 population_{it} + \epsilon_{it} 
\end{aligned}
$$
where $Q_{jt}$: quantity, $P_{jt}$: price, $population_{jt}$: population
As an instrument for price, you use wage, coal price, electricity price, and gas price. The variable $population_{jt}$ is treated as exogenous.

2. Discuss the results above. In particular, explain (1) the importance of adding population as a control variable, and (2) the difference between results with and without IVs. 

2. Discuss the validity of those instruments. 

3. Instead of log-log specification, consider the following linear specification (with population as a control variable)
$$
Q_{jt}  = \beta_0 + \beta_1 P_{jt} + \beta_2 population_{it} + \epsilon_{it}. 
$$
Estimate this specification using instruments. Do not forget checking the 1st stage. 

4. The price elasticity of demand is defined as 
$$
\frac{\partial Q_{jt}}{\partial P_{jt} } \frac{P_{jt}}{Q_{jt}} 
$$
If we use the log-log specification, the coefficient on the price is the elasticity and it is constant across markets and time. Using the estimation result with linear specification, calculate the price elasticity for each observation (i.e., market-year pair). Report the summary statistics of the price elasticity across markets and time. Compare the result with the one from log-log specification that includes population as a control variable.
