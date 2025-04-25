library(tidyverse)
library(palmerpenguins)
library(tidymodels)

# data <- read_rds("data/01_clean_penguins.rds")
#
# glimpse(data)
# summarise(data, mean_bill_length = mean(bill_length_mm), mean_bill_depth = mean(bill_depth_mm))
#
# # Visualizations
# boxplot_fig <- ggplot(data, aes(x = species, y = bill_length_mm, fill = species)) +
#   geom_boxplot() +
#   theme_minimal()
#
# #dir.create("results", showWarnings = FALSE)
# ggsave("results/boxplot.png", boxplot_fig)
#
# # Prepare data for modeling
# data_model <- data %>%
#   select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
#   mutate(species = as.factor(species))
#
# write_rds(data_model, "results/02_model_ready.rds")

#source("R/fit_penguin_model.R")
#library(practice25)

fit_penguin_model(
  input_path = "data/01_clean_penguins.rds",
  output_path = "results/02_model_ready.rds",
  plot_path = "results/boxplot.png"
)
