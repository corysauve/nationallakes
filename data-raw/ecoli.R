ecoli_2017 <- narsscrapr::scrape_nars("NLA", 2017, "E.Coli")

ecoli_2017_clean <- ecoli_2017 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
                date_col = lubridate::mdy(date_col),
                incubation_start_date = lubridate::dmy(incubation_start_date),
                date_received = lubridate::dmy(date_received),
                date_analyzed = lubridate::dmy(date_analyzed))

ecoli <- list("2017" = ecoli_2017_clean)

usethis::use_data(ecoli, overwrite = TRUE)
