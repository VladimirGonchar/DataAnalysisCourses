
curresntDir <- paste(dirname(sys.frame(1)$ofile))
source(paste(curresntDir, "/create_wide_and_long_representations.R", sep = ""), chdir = T)

summary <- data_long %>% select(year, indicator.code, measurement) %>% 
  filter(year >= 1995 & year <= 2005 & grepl("^TX", indicator.code)) %>%
  group_by(indicator.code) %>%
  summarise(min = min(measurement),
            avg = mean(measurement),
            max = max(measurement))

write.csv(summary, "summerised_export_from_long_representation.csv")