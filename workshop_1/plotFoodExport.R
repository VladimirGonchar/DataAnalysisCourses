
source("create_wide_and_long_representations.R", chdir = T)

png("food_export.png")
plot(data_wide$YEAR, data_wide$TX_VAL_FOOD_ZS_UN, type = "b", 
     xlab = "Year", ylab = "% of merchandise exports", sub = "Food exports")
dev.off()