benthic_condition_2007 <- narsscrapr::scrape_nars("NLA", 2007, "Benthic Condition")
benthic_condition_2012 <- narsscrapr::scrape_nars("NLA", 2012, "Benthic Condition")

benthic_condition_2007_clean <- benthic_condition_2007 %>%
  janitor::clean_names() %>%
  dplyr::mutate(date_col = lubridate::mdy(date_col),
                publication_date = lubridate::mdy(publication_date))

benthic_condition_2012_clean <- benthic_condition_2012 %>%
  janitor::clean_names() %>%
  dplyr::mutate(date_col = lubridate::mdy(date_col),
                publication_date = lubridate::mdy(publication_date))


benthic_condition <- list("2007" = benthic_condition_2007_clean,
                          "2012" = benthic_condition_2012_clean)

usethis::use_data(benthic_condition, overwrite = TRUE)
