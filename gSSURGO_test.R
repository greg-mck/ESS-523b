
install.packages("FedData")
install.packages("tidyverse")
install.packages("rnassqs")
library(FedData)
library(tidyverse)
library(rnassqs)

#Once your R packages are loaded, you can tell R what your NASS Quick Stats API key is. You will need this to make an API request later.

NASS_API_KEY <- "077FE359-11AC-32A2-A201-D7905A566F96"
nassqs_auth(key = NASS_API_KEY)


# Set the parameters for the data query
state_abbr <- "CO"
year <- 2017
commodity <- "CROPS"
group <- "PRACTICES"
item <- "REDUCED TILL"
domain <- "COUNTY"
agg_level <- "FARM SIZE"

# Query the NASS Quick Stats API for the data
data <- nassqs(state_alpha = state_abbr,
               year = year,
               commodity_desc = commodity,
               group_desc = group,
               statisticcat_desc = item,
               domain_desc = domain,
               agg_level_desc = agg_level)

# View the resulting data
head(data)

# Download soil data for the state of Colorado
CO_soil <- get_nass_data('gSSURGO',
                         state = 'CO', 
                         year = 2019)

# View the data
head(CO_soil)