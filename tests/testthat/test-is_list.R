test_that("Package data are lists", {
  expect_s3_class(algal_toxins, "list")
  expect_s3_class(atrazine, "list")
  expect_s3_class(benthic_condition, "list")
  expect_s3_class(benthic_counts, "list")
})
