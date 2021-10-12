algal_toxins_2017 <- scrape_nars("NLA", 2017, "Algal Toxin")

algal_toxins <- algal_toxins_2017 %>%
  janitor::clean_names() %>%
  mutate(survey_year = 2017,
         publication_date = mdy(publication_date),
         date_col = mdy(date_col),
         date_received = mdy(date_received),
         date_analyzed = mdy(date_analyzed)) %>%
  rename(unique_id = uid, date_collected = date_col, visit_number = visit_no,
         sample_code = sam_code, reporting_limit = rl,
         analysis_material = matrix) %>%
  select(survey_year, publication_date:nars_flag)

usethis::use_data(algal_toxins, overwrite = TRUE)
