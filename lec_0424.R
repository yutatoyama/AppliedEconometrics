
example_data = data.frame(x = c(1, 3, 5, 7, 9, 1, 3, 5, 7, 9),
                          y = c(rep("Hello", 9), "Goodbye"),
                          z = rep(c(TRUE, FALSE), 5))
# Export csv file.
write.csv(example_data, "temp0424.csv")

library(readr)

example_data_from_csv = read_csv("temp0424.csv")

# Working directory
getwd()

# Change working directory
setwd("C:/Users/Yuta/Dropbox/Teaching/2019S_Applied_Econometrics_JPN_ENG/")

# probably get error
read_csv("temp0424.csv")

# Set again
setwd("C:/Users/Yuta/Dropbox/Teaching/2019S_Applied_Econometrics_JPN_ENG/Material_Github/")

# Load ggplot2
library(ggplot2)

# head()
head(mpg, n = 5)

# View()
View(mpg)

# str(
str(mpg)

# Pick up a particular variable
displacement <- mpg$displ

# summary statistics
summary(mpg)

##################################

library(readr)
pums2000 <- read_csv("data_pums_2000.csv")

pop <- as.vector(pums2000$INCTOT)

# Pop mean and sd
pop_mean = mean(pop)
pop_sd   = sd(pop)

library("ggplot2")
qplot(pop, geom = "density",
      xlab = "Income",
      ylab = "Density")

library("ggplot2")
qplot(pums2000$AGE, geom = "density",
      xlab = "AGE",
      ylab = "Density")

pop = pums2000$AGE
pop_mean = mean(pop)
pop_sd = sd(pop)

# define function for simulation
f_simu_CLT = function(Nsamples, samplesize, pop, pop_mean, pop_sd ){

  output = numeric(Nsamples)
  for (i in 1:Nsamples ){
    test <- sample(x = pop, size = samplesize)
    output[i] <- ( mean(test) - pop_mean ) / (pop_sd / sqrt(samplesize))
  }

  return(output)

}

# Comment: You can do better without using forloop. Let me know if you come with a good idea.

# Run simulation
Nsamples = 2000
result_CLT1 <- f_simu_CLT(Nsamples, 10, pop, pop_mean, pop_sd )
result_CLT2 <- f_simu_CLT(Nsamples, 100, pop, pop_mean, pop_sd )
result_CLT3 <- f_simu_CLT(Nsamples, 1000, pop, pop_mean, pop_sd )

# Random draw from standard normal distribution as comparison
result_stdnorm = rnorm(Nsamples)

# Create dataframe
result_CLT_data <- data.frame(  Ybar_standardized_10 = result_CLT1,
                                Ybar_standardized_100 = result_CLT2,
                                Ybar_standardized_1000 = result_CLT3,
                                Standard_Normal = result_stdnorm)

library("reshape")
data_for_plot <- melt(data = result_CLT_data, variable.name = "Variable" )
fig <-
  ggplot(data = data_for_plot) +
  xlab("Sample mean") +
  geom_line(aes(x = value, colour = variable ),   stat = "density" ) +
  geom_vline(xintercept=0 ,colour="black")

plot(fig)






