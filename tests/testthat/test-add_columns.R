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
