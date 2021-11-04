plankton_model_data <- scrape_nars("NLA", 2007, "Plankton O/E Model Analysis") %>%
  janitor::clean_names()

plankton_model_valid_site <- scrape_nars("NLA", 2007, "Plankton O/E Model  Valid Sites Used") %>%
  janitor::clean_names()

plankton_model_condition_estimates <- scrape_nars("NLA", 2007, "Plankton O/E Model Condition Estimates") %>%
  janitor::clean_names()

plankton_models <- list("2007 O/E Model Analysis" = plankton_model_data,
                        "2007 Validation Sites" = plankton_model_valid_site,
                        "2007 Condition Estimates" = plankton_model_condition_estimates)

usethis::use_data(plankton_models, overwrite = TRUE)
