library(testthat)
library(palmerpenguins)
library(practice25)  # replace with your actual package name if different

test_that("clean_penguin_data creates a cleaned .rds file", {
  temp_file <- tempfile(fileext = ".rds")

  result <- clean_penguin_data(temp_file)

  # File is created
  expect_true(file.exists(temp_file))

  # Data is returned invisibly
  expect_s3_class(result, "data.frame")

  # No missing values
  expect_equal(sum(is.na(result)), 0)

  # Clean up
  unlink(temp_file)
})

test_that("clean_penguin_data creates parent directory if it doesn't exist", {
  nested_path <- file.path(tempdir(), "nested/dir/clean_penguins.rds")

  result <- clean_penguin_data(nested_path)

  expect_true(file.exists(nested_path))
  expect_s3_class(result, "data.frame")

  unlink(dirname(nested_path), recursive = TRUE)
})
