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
number_of_dates <- 100

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
    number_of_accidents = rpois(n = number_of_dates, lambda = 10),
    weather = rbinom(number_of_dates, 1, 0.1 )
  )

write_csv(data, file = "data/raw_data/simulated.csv")


