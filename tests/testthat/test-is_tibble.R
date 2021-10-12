test_that("is tibble", {
  expect_s3_class(algal_toxins, "tbl_df")
  expect_s3_class(benthic_counts, "tbl_df")
})
