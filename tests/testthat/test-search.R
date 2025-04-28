test_that("search_fishery fails and succeeds correctly`", {
  expect_error(fishery_search("Nisq", "ciho"))
  expect_no_error(fishery_search("Nisq", "coho"))
  expect_error(fishery_search(90, "ciho"))
  expect_no_error(fishery_search(90, "coho"))

  expect_error(fishery_search("Nisq", "chanook"))
  expect_no_error(fishery_search("Nisq", "chin"))
  expect_error(fishery_search(90, "chanook"))
  expect_no_error(fishery_search(90, "chin"))
})

test_that("search_stock fails and succeeds correctly`", {
  expect_error(stock_search("Nisq", "ciho"))
  expect_no_error(stock_search("Nisq", "coho"))
  expect_error(stock_search(90, "ciho"))
  expect_no_error(stock_search(90, "coho"))

  expect_error(stock_search("Nisq", "chanook"))
  expect_no_error(stock_search("Nisq", "chin"))
  expect_error(stock_search(90, "chanook"))
  expect_no_error(stock_search(90, "chin"))
})

test_that("search_fishery spot checks succeed`", {
  expect_equal(sort(fishery_search("Nisq", "coho")$fishery_id), c(147, 150))
  expect_equal(sort(fishery_search(100, "coho")$fishery_name), "Samh R Spt")

  expect_equal(fishery_search("snoho", "chin")$fishery_id, c(49, 50))
  expect_equal(fishery_search(40, "chin")$fishery_name, "Tr 7BCDNet")
})

test_that("search_stock spot checks succeed`", {
  expect_equal(sort(stock_search("Nisq", "coho")$stock_id), 67:70)
  expect_equal(sort(stock_search(100, "coho")$stock_name), "M-lakwah")
  expect_equal(sort(stock_search("snoho", "chin")$stock_id), c(13:16))
  expect_equal(stock_search(40, "chin")$stock_name, "M-WA Tule")
})
