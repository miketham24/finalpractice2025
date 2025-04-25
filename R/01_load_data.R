library(tidyverse)
library(palmerpenguins)
library(tidymodels)

# data <- penguins
#
# # Initial cleaning: Remove missing values
# data <- data %>% drop_na()
#
# #dir.create("data", showWarnings = FALSE)
# write_rds(data, "data/01_clean_penguins.rds")

#source("R/clean_penguin_data.R")
#library(practice25)

data <- clean_penguin_data("data/01_clean_penguins.rds")
