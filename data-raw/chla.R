chla_2012 <- narsscrapr::scrape_nars("NLA", 2012, "Chlorophylla")

chla_2012_clean <- chla_2012 %>%
  janitor::clean_names() %>%
  dplyr::mutate(chll_date_analyzed = lubridate::dmy(chll_date_analyzed),
                chlx_date_analyzed = lubridate::dmy(chlx_date_analyzed))

chla <- list("2012" = chla_2012_clean)

usethis::use_data(chla, overwrite = TRUE)
