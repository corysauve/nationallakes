buffer_landuse_metrics_2007 <- narsscrapr::scrape_nars("NLA", 2007, "Buffer Landuse Metrics")
basin_landuse_metrics_2007 <- narsscrapr::scrape_nars("NLA", 2007, "Basin Landuse Metrics")

buffer_landuse_metrics_2007_clean <- buffer_landuse_metrics_2007 %>%
  janitor::clean_names()

basin_landuse_metrics_2007_clean <- basin_landuse_metrics_2007 %>%
  janitor::clean_names()

watershed_variables_2012 <- scrape_nars("NLA", 2012, "Watershed Variables") %>%
  janitor::clean_names()

buffer_landuse_metrics <- list("2007" = buffer_landuse_metrics_2007_clean)
basin_landuse_metrics <- list("2007" = basin_landuse_metrics_2007_clean)
watershed_variables <- list("2012" = watershed_variables_2012)

usethis::use_data(buffer_landuse_metrics, overwrite = TRUE)
usethis::use_data(basin_landuse_metrics, overwrite = TRUE)
usethis::use_data(watershed_variables, overwrite = TRUE)
