#### Preamble ####
# Purpose: Downloads and saves the data from Opne Data Toronto 
# Author: Jason Yang 
# Date: 22 September 2024 
# Contact: jzc.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
# get package
package <- show_package("0b6d3a00-7de1-440b-b47c-7252fd13929f")

# get all resources for this package
resources <- list_package_resources("0b6d3a00-7de1-440b-b47c-7252fd13929f")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
#### Save data ####
# 
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "data/raw_data/unedited_data.csv") 

         
