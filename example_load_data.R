library(here)
library(tidyverse)

# Here is the abundance/count data for the inverts ("taxon" denoted by Operational Taxonomic Unit (otu)). 
invert_df <- read_csv(here("data/inverts_coarse-OTU-resolution.csv"))

#Some information on the sites and where they are
sites <-  read_csv(here("data/site_locations.csv"))

# Watershed and climate predictors (potential covariates) 
# Climate variables (e.g., annual temp/precip) and watershed variables (e.g., elevation, slope, catchment covered in forest) 
ws_df <- read_csv(here("data/catchment-descriptors_tidied.csv"))|>
  select(-c(site_name,project, park))|>
  mutate(perwetland = perwoodywetlands+peremergentherbwetlands, perforest = permixedforest+perevergreenforest+perdeciduousforest, roadtrail = roaddensity,traildensity)