context("Testing fuzzy operators")

test_that("NA values are ignored in special cases (0 and 1 for .T and .S).", {
  x <- c(NA, NA, 0, 0, 1)
  y <- c(NA, 1, NA, 0, 1)
  expect_identical(.T(x,y), c(NA,NA,0,0,1))
  expect_identical(.S(x,y), c(NA,1,NA,0,1))
})

test_that("Default Zadeh type fuzzy logic matches definitions in sets package.", {
  x <- c(0.1, 0.2, 0.3)
  y <- c(0.3, 0.2, 0.1)
  expect_identical(.T(x,y), pmin(x,y))
  expect_identical(.S(x,y), pmax(x,y))
})
