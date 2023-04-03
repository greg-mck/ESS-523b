
library(tidyverse)
library(dplyr)
library(ggplot2)
RawFarmsTab <- read.csv("Farms-tab.csv")

# AvgFarmSizeData <- RawFarmsTab[, c("FIPS","y17_M003_valueNumeric")] 
# 
# AvgFarmSizeData< -AvgFarmSizeData %>% 
#   mutate(AvgFarmSizeAcres = rename(y17_M003_valueNumeric))

# This code mostly just grabs and renames the most important data columns
FarmSize.clean <-  RawFarmsTab %>%
  dplyr::select(FIPS = FIPS,
                AvgFarmSizeAcres = y17_M003_valueNumeric)
#write clean farm size by fips code data to csv
#write.csv(FarmSize.clean, file = "CleanFarmSizeByFipsData.csv", row.names = FALSE)

p <- ggplot(FarmSize.clean, mapping = aes(x= AvgFarmSizeAcres))+
  geom_histogram(binwidth = 1000)
p

p1 <- ggplot(FarmSize.clean, aes(y = AvgFarmSizeAcres)) + 
  geom_boxplot()
p1

p2 <- ggplot(FarmSize.clean, mapping = aes(x= FIPS, y = AvgFarmSizeAcres))+
  geom_point()
p2

