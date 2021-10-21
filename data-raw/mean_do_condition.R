mean_do_condition_2007 <- narsscrapr::scrape_nars("NLA", 2007, "Mean DO Condition Estimate")

mean_do_condition_2007_clean <- mean_do_condition_2007 %>%
  janitor::clean_names()

mean_do_condition <- list("2007" = mean_do_condition_2007_clean)

usethis::use_data(mean_do_condition, overwrite = TRUE)
