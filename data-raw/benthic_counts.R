benthic_count_2007 <- scrape_nars("NLA", 2007, "Benthic Count")
benthic_count_2012 <- scrape_nars("NLA", 2012, "Benthic Count") %>% select(-YEAR)
benthic_count_2017 <- scrape_nars("NLA", 2017, "Benthic Count")

benthic_count_2007_clean <- benthic_count_2007 %>%
  janitor::clean_names() %>%
  mutate(year = 2007,
         publication_date = mdy(publication_date),
         date_col = mdy(date_col),
         non_target = "Not included in 2007",
         is_distinct = "Not included in 2007") %>%
  rename(unique_id = uid, date_collected = date_col, visit_number = visit_no,
         functional_feeding_group = ffg, pollution_tolerance_value = ptv) %>%
  select(year, unique_id, site_id, aggr_eco3_2015, aggr_eco9_2015, state, eco_bio,
         visit_number, date_collected, taxa_id, target_taxon, non_target, total_300, is_distinct,
         is_distinct_300, phylum, class, order, tribe, family, subfamily, genus,
         functional_feeding_group, habit, pollution_tolerance_value, publication_date)

benthic_count_2012_clean <- benthic_count_2012 %>%
  janitor::clean_names() %>%
  mutate(year = 2012,
         publication_date = mdy(publication_date),
         date_col = mdy(date_col),
         non_target = "Not included in 2012",
         is_distinct = "Not included in 2012") %>%
  rename(unique_id = uid, date_collected = date_col, visit_number = visit_no,
         functional_feeding_group = ffg, pollution_tolerance_value = ptv) %>%
  select(year, unique_id, site_id, aggr_eco3_2015, aggr_eco9_2015, state, eco_bio,
         visit_number, date_collected, taxa_id, target_taxon, non_target, total_300, is_distinct,
         is_distinct_300, phylum, class, order, tribe, family, subfamily, genus,
         functional_feeding_group, habit, pollution_tolerance_value, publication_date)

benthic_count_2017_clean <- benthic_count_2017 %>%
  janitor::clean_names() %>%
  mutate(year = 2017,
         eco_bio = "Not included in 2017",
         aggr_eco3_2015 = "Not included in 2017",
         aggr_eco9_2015 = "Not included in 2017",
         state = "Not included in 2017",
         publication_date = mdy(publication_date),
         date_col = dmy(date_col),
         is_distinct = as.character(is_distinct)) %>%
  rename(unique_id = uid, date_collected = date_col, visit_number = visit_no,
         functional_feeding_group = ffg, pollution_tolerance_value = ptv) %>%
  select(year, unique_id, site_id, aggr_eco3_2015, aggr_eco9_2015, state, eco_bio,
         visit_number, date_collected, taxa_id, target_taxon, non_target, total_300, is_distinct,
         is_distinct_300, phylum, class, order, tribe, family, subfamily, genus,
         functional_feeding_group, habit, pollution_tolerance_value, publication_date)

benthic_counts <- bind_rows(benthic_count_2007_clean, benthic_count_2012_clean, benthic_count_2017_clean)

usethis::use_data(benthic_counts, overwrite = TRUE)
