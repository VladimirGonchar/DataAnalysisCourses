
source(paste(dirname(sys.frame(1)$ofile), "/create_wide_and_long_representations.R", sep = ""), chdir = T)

export <- data_wide %>% 
  select(YEAR, starts_with("TX")) %>% 
  filter(YEAR >= 1995 & YEAR <= 2005) %>% 
  mutate_each(funs(ifelse(is.na(.), mean(., na.rm = T), .))) %>%
  summarise_each(funs(mean), starts_with("TX"))

View(export)