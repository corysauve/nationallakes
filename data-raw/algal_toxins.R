algal_toxins_2017 <- scrape_nars("NLA", 2017, "Algal Toxin")

algal_toxins <- algal_toxins_2017 %>%
  janitor::clean_names() %>%
  mutate(publication_date = mdy(publication_date),
         date_col = mdy(date_col),
         date_received = mdy(date_received),
         date_analyzed = mdy(date_analyzed)) %>%
  rename(unique_id = uid, date_collected = date_col, visit_number = visit_no,
         sample_code = sam_code, reporting_limit = rl,
         analysis_material = matrix)

algal_toxins <- list("2017" = algal_toxins)

usethis::use_data(algal_toxins, overwrite = TRUE)
