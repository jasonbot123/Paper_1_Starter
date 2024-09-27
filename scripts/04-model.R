#### Preamble ####
# Purpose: Models the Collision Data 
# Author: Jason Yang
# Date: 22 September 2024  
# Contact: jzc.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have the data cleaned
# Any other information needed? None 


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(ggplot2)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
set.seed(1008783461)

#Model the accidents according to year
accidents_per_year <- as.data.frame(table(analysis_data$YEAR))
colnames(accidents_per_year) <- c("Year", "Number_of_Accidents")
first_model <- ggplot(accidents_per_year, aes(x = Year, y = Number_of_Accidents)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Bar graph
  labs(title = "Number of Accidents per Year", x = "Year", y = "Number of Accidents") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Model the accidents according to the district
accidents_per_district <- as.data.frame((table(analysis_data$DISTRICT)))
colnames(accidents_per_district) <- c("District", "Number_of_Accidents")
accidents_per_district <- accidents_per_district %>% filter(District != "None")
ggplot(accidents_per_district, aes(x = District, y = Number_of_Accidents)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Bar graph
  labs(title = "Number of Accidents per district", x = "District", y = "Number of Accidents") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

Vision_accidents <- as.data.frame((table(analysis_data$VISIBILITY)))
colnames(Vision_accidents) <- c("Visibility", "Number_of_Accidents")
Vision_accidents <- Vision_accidents %>% filter(Visibility != "None")
ggplot(Vision_accidents, aes(x = Visibility, y = Number_of_Accidents)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Bar graph
  labs(title = "Visibility of the Road with Response to Accidents", x = "Visibility", y = "Number of Accidents") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

Driver_cond <- as.data.frame((table(analysis_data$DRIVCOND)))
colnames(Driver_cond) <- c("Drivers_Condition", "Number_of_Accidents")
Driver_cond <- Driver_cond %>% filter(Drivers_Condition != "None")
ggplot(Driver_cond, aes(x = Drivers_Condition, y = Number_of_Accidents)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Bar graph
  labs(title = "Condition of the Driver", x = "Visibility", y = "Number of Accidents") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

Speeding <- as.data.frame((table(analysis_data$SPEEDING)))
colnames(Speeding) <- c("Speeding", "Number_of_Accidents")
ggplot(Speeding, aes(x = Speeding, y = Number_of_Accidents)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Bar graph
  labs(title = "Is Speeding the Cause of Accidents?", x = "Speeding", y = "Number of Accidents") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

Aggresive_Driving <- as.data.frame((table(analysis_data$AG_DRIV)))
colnames(Aggresive_Driving) <- c("Aggresive_Driving", "Number_of_Accidents")
second_model <- ggplot(Aggresive_Driving, aes(x = Aggresive_Driving, y = Number_of_Accidents)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Bar graph
  labs(title = "Was the Driver Aggresive Driving?", x = "Aggresive Driving", y = "Number of Accidents") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


