test_that("is tibble", {
  expect_s3_class(algal_toxins[["2017"]], "tbl_df")

  expect_s3_class(atrazine[["2012"]], "tbl_df")
  expect_s3_class(atrazine[["2017"]], "tbl_df")

  expect_s3_class(benthic_counts[["2007"]], "tbl_df")
  expect_s3_class(benthic_counts[["2012"]], "tbl_df")
  expect_s3_class(benthic_counts[["2017"]], "tbl_df")

  expect_s3_class(benthic_condition[["2007"]], "tbl_df")
  expect_s3_class(benthic_condition[["2012"]], "tbl_df")
})
