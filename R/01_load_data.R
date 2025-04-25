library(tidyverse)
library(palmerpenguins)
library(tidymodels)

data <- penguins

# Initial cleaning: Remove missing values
data <- data %>% drop_na()