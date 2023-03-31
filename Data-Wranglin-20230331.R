
library(tidyverse)
library(dplyr)
RawFarmsTab <- read.csv("Farms-tab.csv")

# AvgFarmSizeData <- RawFarmsTab[, c("FIPS","y17_M003_valueNumeric")] 
# 
# AvgFarmSizeData< -AvgFarmSizeData %>% 
#   mutate(AvgFarmSizeAcres = rename(y17_M003_valueNumeric))

# This code mostly just grabs and renames the most important data columns
FarmSize.clean <-  RawFarmsTab %>%
  dplyr::select(FIPS = FIPS,
                AvgFarmSizeAcres = y17_M003_valueNumeric)