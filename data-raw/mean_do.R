mean_do_2007 <- narsscrapr::scrape_nars("NLA", 2007, "Mean DO")

mean_do_2007_clean <- mean_do_2007 %>%
  janitor::clean_names()

mean_do <- list("2007" = mean_do_2007_clean)

usethis::use_data(mean_do, overwrite = TRUE)
