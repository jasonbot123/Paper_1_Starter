#### Preamble ####
# Purpose: Simulates data
# Author: Jason Yang
# Date: 21-09-2024
# Contact: jzc.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
# 

#### Simulate data ####
set.seed(1008783461) #Used student id for viewers to replicate my code

#Defining the start and end date 
start_date <- as.Date("2006-01-01")
end_date <- as.Date("2023-12-31")

#Set the number of random dates generated
n = 100

#Stimulate 100 observations of the Data with the relevant variables
data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_dates,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    number_of_accidents = rpois(n = n, lambda = 10),
    WEATHER = rbinom(number_of_dates, 1, 0.1 ),
    DISTRICT <- sample(c('Downtown', 'Northside', 'East End', 'West End', 'Suburb'), n, replace=TRUE),
    DRIV_COND <- sample(c('Normal', 'Fatigued', 'Intoxicated', 'Distracted'), n, replace=TRUE),
    ACCLASS <- sample(c('Minor', 'Serious', 'Fatal'), n, replace=TRUE),
    INJURY <- sample(c('None', 'Minor', 'Major', 'Fatal'), n, replace=TRUE),
    SPEEDING <- sample(c('Yes', 'No'), n, replace=TRUE),
    AG_DRIV <- sample(c('Yes', 'No'), n, replace=TRUE)
    
    
  )


write_csv(data, file = "data/raw_data/simulated.csv")


