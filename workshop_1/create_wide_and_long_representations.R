library(tidyr)

# extract data from csv
csv_files <- list.files("resources/data_dir", ".*.csv", recursive=T, full.names=T)
data <- read.csv(csv_files[1], skip = 3)

# gather data into long representation
data_long <- data[,-c(3, ncol(data))] %>% 
  gather(key=year, value=measurement, -Country.Name, -Country.Code, -Indicator.Code, na.rm=T)

data_long$year <- extract_numeric(data_long$year)
names(data_long) <- tolower(names(data_long))

# spread data into wide represenattion
data_wide <- spread(data_long, key = indicator.code, value = measurement)
names(data_wide) <- gsub("\\.", "_", names(data_wide))
names(data_wide) <- toupper(names(data_wide))