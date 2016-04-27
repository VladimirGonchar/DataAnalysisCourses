
curresntDir <- paste(dirname(sys.frame(1)$ofile))
source(paste(curresntDir, "/create_wide_and_long_representations.R", sep = ""), chdir = T)

summary <- data_wide %>% 
  select(YEAR, starts_with("TX")) %>% 
  filter(YEAR >= 1995 & YEAR <= 2005) %>% 
  mutate_each(funs(ifelse(is.na(.), mean(., na.rm = T), .))) %>%
  summarise_each(funs(mean), starts_with("TX"))

write.csv(summary, "summerised_export_from_wide_representation.csv")