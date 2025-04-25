#' Perform EDA and prepare penguin data for modeling
#'
#' This function reads the cleaned penguin dataset, performs exploratory data analysis
#' (summary stats and boxplot visualization), saves a figure to the `results/` directory,
#' and returns the dataset prepared for modeling (selected features and factor conversion).
#'
#' @param input_path A string specifying the path to the cleaned `.rds` file (default: `"data/01_clean_penguins.rds"`).
#' @param output_path A string specifying where to save the processed modeling dataset (default: `"results/02_model_ready.rds"`).
#' @param plot_path A string specifying where to save the EDA boxplot (default: `"results/boxplot.png"`).
#'
#' @return Invisibly returns the prepared data frame for modeling.
#' @export
#'
#' @examples
#' fit_penguin_model()
fit_penguin_model <- function(
    input_path = "data/01_clean_penguins.rds",
    output_path = "results/02_model_ready.rds",
    plot_path = "results/boxplot.png"
) {
  library(tidyverse)
  library(palmerpenguins)
  library(tidymodels)
  library(practice25)


  data <- read_rds(input_path)

  # Print summary stats (for inspection, optional)
  glimpse(data)
  summarise(data, mean_bill_length = mean(bill_length_mm), mean_bill_depth = mean(bill_depth_mm))

  # Create and save boxplot
  boxplot_fig <- ggplot(data, aes(x = species, y = bill_length_mm, fill = species)) +
    geom_boxplot() +
    theme_minimal()

  dir.create(dirname(plot_path), showWarnings = FALSE, recursive = TRUE)
  ggsave(plot_path, boxplot_fig, width = 6, height = 4)

  # Prepare data for modeling
  data_model <- data %>%
    select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
    mutate(species = as.factor(species))

  dir.create(dirname(output_path), showWarnings = FALSE, recursive = TRUE)
  write_rds(data_model, output_path)

  invisible(data_model)
}

