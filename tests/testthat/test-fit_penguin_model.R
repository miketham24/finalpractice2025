library(testthat)
library(tidyverse)
library(palmerpenguins)
library(practice25)

test_that("fit_penguin_model creates expected files and output", {
  skip_if_not_installed("tidymodels")

  # Setup temp paths
  tmp_input <- tempfile(fileext = ".rds")
  tmp_output <- tempfile(fileext = ".rds")
  tmp_plot <- tempfile(fileext = ".png")

  # Use a small cleaned dataset
  clean_data <- penguins %>% drop_na()
  write_rds(clean_data, tmp_input)

  # Run function
  result <- fit_penguin_model(input_path = tmp_input,
                              output_path = tmp_output,
                              plot_path = tmp_plot)

  # Check files were created
  expect_true(file.exists(tmp_output))
  expect_true(file.exists(tmp_plot))

  # Check returned value is a data frame
  expect_s3_class(result, "data.frame")

  # Check expected columns exist
  expect_true(all(c("species", "bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g") %in% colnames(result)))

  # Check species is a factor
  expect_true(is.factor(result$species))
})
