phyt_soft_algae_2007 <- readr::read_csv(here("data", "nla2007_phytoplankton_softalgaecount.csv")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(date_col = lubridate::mdy(date_col),
                datephyt = lubridate::mdy(datephyt))

phyt_diatoms_2007 <- readr::read_csv(here("data", "nla2007_phytoplankton_diatomcount.csv")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(datephyt = lubridate::mdy(datephyt),
                sourcedate = lubridate::ymd(sourcedate))

phyt_sample_info_2007 <- readr::read_csv(here("data", "nla2007_phytoplankton_sampleinfo.csv")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(date_col = lubridate::mdy(date_col),
                datephyt = lubridate::mdy(datephyt))

phyt_taxa_2012 <- readr::read_csv(here("data", "nla2012_phytotaxa_wide.csv")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date))

phyt_counts_2012 <- readr::read_csv(here("data", "nla2012_wide_phytoplankton_count.csv")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(date_col = lubridate::mdy(date_col),
                publication_date = lubridate::mdy(publication_date))

phyt_counts_2017 <- readr::read_csv(here("data", "nla_2017_phytoplankton_count-data.csv")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date),
                date_col = lubridate::mdy(date_col))

phyt_taxa_2017 <- readr::read_csv(here("data", "nla_2017_phytoplankton_taxa-data.csv")) %>%
  janitor::clean_names() %>%
  dplyr::mutate(publication_date = lubridate::mdy(publication_date))

phyt_counts <- list("2007 Soft Algae" = phyt_soft_algae_2007,
                    "2007 Diatoms" = phyt_diatoms_2007,
                    "2012" = phyt_counts_2012,
                    "2017" = phyt_counts_2017)

phyt_taxa <- list("2012" = phyt_taxa_2012,
                  "2017" = phyt_taxa_2017)

phyt_sample_info <- list("2007" = phyt_sample_info_2007)

usethis::use_data(phytoplankton, overwrite = TRUE)
