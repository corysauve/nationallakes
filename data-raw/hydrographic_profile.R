hydro_profile_2012 <- narsscrapr::scrape_nars("NLA", 2012, "Profile")
hydro_profile_2017 <- narsscrapr::scrape_nars("NLA", 2017, "Profile")

hydro_profile_2012_clean <- hydro_profile_2012 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
                date_col = lubridate::dmy(date_col))

hydro_profile_2017_clean <- hydro_profile_2017 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
                date_col = lubridate::dmy(date_col))

hydrographic_profile <- list("2012" = hydro_profile_2012_clean,
                             "2017" = hydro_profile_2017_clean)

usethis::use_data(hydrographic_profile, overwrite = TRUE)
