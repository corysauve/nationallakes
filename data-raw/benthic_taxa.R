benthic_taxa_2012 <- narsscrapr::scrape_nars("NLA", 2012, "Benthic Taxa List")
benthic_taxa_2017 <- narsscrapr::scrape_nars("NLA", 2017, "Benthic Taxa List")

benthic_taxa_2012_clean <- benthic_taxa_2012 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date))

benthic_taxa_2017_clean <- benthic_taxa_2017 %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date))


benthic_taxa <- list("2012" = benthic_taxa_2012_clean,
                     "2017" = benthic_taxa_2017_clean)

usethis::use_data(benthic_taxa, overwrite = TRUE)
