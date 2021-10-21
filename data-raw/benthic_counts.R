benthic_count_2007 <- narsscrapr::scrape_nars("NLA", 2007, "Benthic Count")
benthic_count_2012 <- narsscrapr::scrape_nars("NLA", 2012, "Benthic Count") %>% select(-YEAR)
benthic_count_2017 <- narsscrapr::scrape_nars("NLA", 2017, "Benthic Count")

benthic_count_2007_clean <- benthic_count_2007 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
         date_col = lubridate::mdy(date_col))

benthic_count_2012_clean <- benthic_count_2012 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
         date_col = lubridate::mdy(date_col))

benthic_count_2017_clean <- benthic_count_2017 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
         date_col = lubridate::dmy(date_col),
         is_distinct = as.character(is_distinct))

benthic_counts <- list("2007" = benthic_count_2007_clean,
                       "2012" = benthic_count_2012_clean,
                       "2017" = benthic_count_2017_clean)

usethis::use_data(benthic_counts, overwrite = TRUE)
