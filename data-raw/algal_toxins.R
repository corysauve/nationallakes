algal_toxins_2017 <- scrape_nars("NLA", 2017, "Algal Toxin")

algal_toxins <- algal_toxins_2017 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
         date_col = lubridate::mdy(date_col),
         date_received = lubridate::mdy(date_received),
         date_analyzed = lubridate::mdy(date_analyzed))

algal_toxins <- list("2017" = algal_toxins)

usethis::use_data(algal_toxins, overwrite = TRUE)
