benthic_metrics_2007 <- narsscrapr::scrape_nars("NLA", 2007, "Benthic Metrics")
benthic_metrics_2012 <- narsscrapr::scrape_nars("NLA", 2012, "Benthic Metrics")
benthic_metrics_2017 <- narsscrapr::scrape_nars("NLA", 2017, "Benthic Metrics")

benthic_metrics_2007_clean <- benthic_metrics_2007 %>%
  janitor::clean_names() %>%
  mutate(date_col = mdy(date_col))

benthic_metrics_2012_clean <- benthic_metrics_2012 %>%
  janitor::clean_names() %>%
  mutate(date_col = mdy(date_col))

benthic_metrics_2017_clean <- benthic_metrics_2017 %>%
  janitor::clean_names() %>%
  mutate(date_col = mdy(date_col),
         publication_date = mdy(publication_date))

benthic_metrics <- list("2007" = benthic_metrics_2007_clean,
                        "2012" = benthic_metrics_2012_clean,
                        "2017" = benthic_metrics_2017_clean)

usethis::use_data(benthic_metrics, overwrite = TRUE)
