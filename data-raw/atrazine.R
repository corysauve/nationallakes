atrazine_2012 <- scrape_nars("NLA", 2012, "Atrazine")
atrazine_2017 <- scrape_nars("NLA", 2017, "Atrazine")

atrazine_2012_clean <- atrazine_2012 %>%
  janitor::clean_names() %>%
  rename(date_collected = date_col, atrazine_ppb = atrazine_result,
         flag = atrazine_flag, date_analyzed = atrazine_date_analyzed,
         date_received = atrazine_date_received, batch_id = atrazine_batch_id,
         mdl_ppb = atrazine_mdl, qa_flag = atrazine_qa_flag, holding_time_days = atrazine_holding_time,
         limit_of_quantitation_ppb = atrazine_loq, units = atrazine_units,
         unique_id = uid, bioregions = eco_bio, sample_id = tria_sample_id, visit_number = visit_no) %>%
  mutate(publication_date = mdy(publication_date),
         date_collected = mdy(date_collected),
         date_received = mdy(date_received),
         date_analyzed = mdy(date_analyzed))

atrazine_2017_clean <- atrazine_2017 %>%
  janitor::clean_names() %>%
  rename(date_collected = date_col, analysis_material = matrix,
         mdl_ppb = mdl, reporting_limit = rl, sample_code = sam_code,
         unqiue_id = uid, visit_number = visit_no) %>%
  mutate(date_collected = dmy(date_collected),
         date_received = dmy(date_received),
         date_analyzed = dmy(date_analyzed),
         publication_date = mdy(publication_date))


atrazine <- list("2012" = atrazine_2012_clean,
                 "2017" = atrazine_2017_clean)

usethis::use_data(atrazine, overwrite = TRUE)
