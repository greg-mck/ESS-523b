
install.packages("FedData")
install.packages("tidyverse")
install.packages("rnassqs")
library(FedData)
library(tidyverse)
library(rnassqs)

#Once your R packages are loaded, you can tell R what your NASS Quick Stats API key is. You will need this to make an API request later.

NASS_API_KEY <- "077FE359-11AC-32A2-A201-D7905A566F96"
nassqs_auth(key = NASS_API_KEY)

nc_sweetpotato_params <- list(commodity_desc = "SWEET POTATOES" ,
                              state_alpha = "NC" ,
                              agg_level_desc = "COUNTY" ,
                              unit_desc = "ACRES" , 
                              domain_desc = "TOTAL" , 
                              statisticcat_desc = "AREA HARVESTED" , 
                              prodn_practice_desc = "ALL PRODUCTION PRACTICES
")
nc_sweetpotato_data_raw <- nassqs(nc_sweetpotato_params)


# Set the parameters for the data query
state_abbr <- "CO"

commodity <- "CROPS"
group <- "PRACTICES"
item <- "REDUCED TILL"
domain <- "COUNTY"
agg_level <- "FARM SIZE"

# This doesnt work....Query the NASS Quick Stats API for the data
data <- nassqs(state_alpha = "CO",
               year__GE = 2012,
               commodity_desc = "CROPS",
               group_desc = "PRACTICES",
               domain_desc = "COUNTY")

# View the resulting data
head(data)

# This works...Parameters to query on and data call
params <- list(commodity_desc = "CORN", year__GE = 2012, state_alpha = "VA")
d <- nassqs(params)

# Download soil data for the state of Colorado
CO_soil <- get_nass_data('gSSURGO',
                         state = 'CO', 
                         year = 2019)

# View the data
head(CO_soil)