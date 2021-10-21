atrazine_2012 <- narsscrapr::scrape_nars("NLA", 2012, "Atrazine")
atrazine_2017 <- narsscrapr::scrape_nars("NLA", 2017, "Atrazine")

atrazine_2012_clean <- atrazine_2012 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
                date_col = lubridate::mdy(date_col),
                atrazine_date_received = lubridate::mdy(atrazine_date_received),
                atrazine_date_analyzed = lubridate::mdy(atrazine_date_analyzed))

atrazine_2017_clean <- atrazine_2017 %>%
  janitor::clean_names() %>%
  dplyr::mutate(date_col = lubridate::dmy(date_col),
                date_received = lubridate::dmy(date_received),
                date_analyzed = lubridate::dmy(date_analyzed),
                publication_date = lubridate::mdy(publication_date))


atrazine <- list("2012" = atrazine_2012_clean,
                 "2017" = atrazine_2017_clean)

usethis::use_data(atrazine, overwrite = TRUE)
