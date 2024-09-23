#### Preamble ####
# Purpose: Cleans the raw collision data into an analysis dataset 
# Author: Jason Yang 
# Date: 22 September 2024
# Contact: jzc.yang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: Need to have downloaded the data 
# Any other information needed? None 

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/unedited_data.csv")

cleaned_data <-
  raw_data |>
  select(DATE, TIME, VISIBILITY, DISTRICT, INVAGE, DRIVCOND, ACCLASS, INJURY) |>
  tidyr::drop_na() 
cleaned_data$DATE <- format(as.Date(cleaned_data$DATE), "%Y")
cleaned_data <- cleaned_data %>% rename(YEAR = DATE)




#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

