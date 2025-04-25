#' Clean Palmer Penguins Dataset and Save as RDS
#'
#' This function removes missing values from the `palmerpenguins` dataset
#' and saves the cleaned data to the specified output path.
#'
#' @param output_path A string specifying where to save the cleaned dataset (as `.rds`).
#'
#' @return Invisibly returns the cleaned data frame.
#' @export
#'
#' @examples
#' clean_penguin_data("data/01_clean_penguins.rds")
clean_penguin_data <- function(output_path) {
  library(tidyverse)
  library(palmerpenguins)

  data <- palmerpenguins::penguins %>% drop_na()

  dir.create(dirname(output_path), showWarnings = FALSE, recursive = TRUE)
  write_rds(data, output_path)

  return(data)
}
