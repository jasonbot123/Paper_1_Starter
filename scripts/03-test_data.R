#### Preamble ####
# Purpose: Tests Stimulated Data
# Author: Jason Yang
# Date: 21 September 2024
# Contact: jzc.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Needs to have simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
# 

#### Test data ####
all(is.na(data$number_of_accidents)) #Test for NAs 
data$number_of_accidents |> min() <= 0 #Test for negative numbers in number of accidents
all(data$number_of_accidents <= 100) #Test whether there are an impossible number of accidents on a specific date 
all(data$dates > as.Date("2005-12-31")) #Test whether all dates are later than the specified date

