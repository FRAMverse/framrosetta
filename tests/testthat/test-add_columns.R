test_that("label_fisheries argument validations work", {
  expect_error(label_fisheries(.data = 1:5, species = "coho"))
  data = data.frame(x = 1:10, y = 501:510, z = letters[1:10], alpha = c(1:9, NA))
  ## requires species attribute or species argument, plus `fishery_id` column or fisheries_col argumnet
  expect_error(label_fisheries(data))
  expect_error(label_fisheries(data, species = "COHO"))
  ## fisheries_col should be a numeric
  expect_error(label_fisheries(data, species = "COHO", fisheries_col = "z"))
  ## fisheries_col should be within possible fisheries range
  expect_error(label_fisheries(data, species = "COHO", fisheries_col = "y"))
  expect_no_error(label_fisheries(data, species = "COHO", fisheries_col = "alpha"))
  ## should get error if trying to add chinook fisheries to coho stock table -- fishery_id out of range
  expect_error(label_fisheries(fishery_coho_fram, species = "CHINOOK"))
})


test_that("label_fisheries gives correct answers", {
  ## just compare against stock tables
  expect_equal(label_fisheries(.data = fishery_chinook_fram)$fishery_label, fishery_chinook_fram$fishery_title)
  expect_equal(label_fisheries(.data = fishery_coho_fram)$fishery_label, fishery_coho_fram$fishery_title)
})


test_that("label_stock argument validations work", {
  expect_error(label_stocks(.data = 1:5, species = "coho"))
  data = data.frame(x = 1:10, y = 501:510, z = letters[1:10], alpha = c(1:9, NA))
  ## requires species attribute or species argument, plus `stock_id` column or fisheries_col argumnet
  expect_error(label_stocks(data))
  expect_error(label_stocks(data, species = "COHO"))
  ## fisheries_col should be a numeric
  expect_error(label_stocks(data, species = "COHO", stocks_col = "z"))
  ## fisheries_col should be within possible fisheries range
  expect_error(label_stocks(data, species = "COHO", stocks_col = "y"))
  expect_no_error(label_stocks(data, species = "COHO", stocks_col = "alpha"))
  ## should get error if trying to add chinook fisheries to coho stock table -- fishery_id out of range
  expect_error(label_stocks(stock_coho_fram, species = "CHINOOK"))
})


test_that("label_fisheries gives correct answers", {
  ## just compare against stock tables
  expect_equal(label_stocks(.data = stock_chinook_fram)$stock_label, stock_chinook_fram$stock_long_name)
  expect_equal(label_stocks(.data = stock_coho_fram)$stock_label, stock_coho_fram$stock_long_name)
})


# ## test written with claude
# test_that("label_fisheries works correctly, written by Claude", {
#   # Test data
#   test_data <- data.frame(fishery_id = c(1, 2, 3, NA))
#
#   # Mock framrosetta data
#     mock_chinook = data.frame(
#       fishery_id = 1:5,
#       fishery_title = paste("Fishery", 1:5)
#     )
#     mock_coho = data.frame(
#       fishery_id = 1:3,
#       fishery_title = paste("Coho Fishery", 1:3)
#     )
#
#   with_mocked_bindings(
#     code = {
#       # Test basic functionality
#       result <- label_fisheries(test_data, species = "CHINOOK")
#       expect_true("fishery_label" %in% names(result))
#       expect_equal(result$fishery_label[1], "Fishery 1")
#       expect_true(is.na(result$fishery_label[4]))
#
#       # Test with species attribute
#       attr(test_data, "species") <- "COHO"
#       result2 <- label_fisheries(test_data)
#       expect_equal(result2$fishery_label[1], "Coho Fishery 1")
#
#       # Test custom column name
#       test_data2 <- data.frame(custom_fishery = c(1, 2))
#       result3 <- label_fisheries(test_data2, species = "CHINOOK", fisheries_col = "custom_fishery")
#       expect_true("fishery_label" %in% names(result3))
#
#       # Test errors
#       expect_error(label_fisheries(data.frame(x = 1), species = "CHINOOK"))
#       expect_error(label_fisheries(test_data))
#       expect_error(label_fisheries(data.frame(fishery_id = "a"), species = "CHINOOK"))
#       expect_error(label_fisheries(data.frame(fishery_id = 999), species = "CHINOOK"))
#     },
#     fishery_chinook_fram = mock_chinook,
#     fishery_coho_fram = mock_coho,
#     .package = "framrosetta"
#   )
# })
# The error occurs because `with_mocked_bindings()` creates temporary bindings that only exist within the `code` block, but your original tests outside the mocked block are still trying to access `fishery_chinook_fram` and `fishery_coho_fram` which don't exist in the global environment.

# Move your original tests inside the `with_mocked_bindings()` block:
# r
# test_that("label_fisheries works correctly v2, claude", {
#   # Mock data
#   mock_chinook <- data.frame(
#     fishery_id = 1:5,
#     fishery_title = paste("Fishery", 1:5)
#   )
#   mock_coho <- data.frame(
#     fishery_id = 1:3,
#     fishery_title = paste("Coho Fishery", 1:3)
#   )
#
#   with_mocked_bindings(
#     code = {
#       # Your original validation tests
#       expect_error(label_fisheries(.data = 1:5, species = "coho"))
#       data <- data.frame(x = 1:10, y = 501:510, z = letters[1:10], alpha = c(1:9, NA))
#       expect_error(label_fisheries(data))
#       expect_error(label_fisheries(data, species = "COHO"))
#       expect_error(label_fisheries(data, species = "COHO", fisheries_col = "z"))
#       expect_error(label_fisheries(data, species = "COHO", fisheries_col = "y"))
#       expect_no_error(label_fisheries(data, species = "COHO", fisheries_col = "alpha"))
#
#       # Your original correctness tests
#       expect_equal(label_fisheries(.data = fishery_chinook_fram)$fishery_label, fishery_chinook_fram$fishery_title)
#       expect_equal(label_fisheries(.data = fishery_coho_fram)$fishery_label, fishery_coho_fram$fishery_title)
#     },
#     fishery_chinook_fram = mock_chinook,
#     fishery_coho_fram = mock_coho
#   )
# })
