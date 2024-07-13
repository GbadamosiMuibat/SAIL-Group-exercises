#Loading libraries
library(tidyverse)
library(tidygeocoder)
library(sf)
library(mapview)
library(skimr)
library(janitor)
library(leaflet)



#Reverse Geo-coding(have the lat and lon,want to get the physical address)
#read data
Stanbic_Ibtc_Branches <- read.csv("C:/Users/user/Downloads/Stanbic_Ibtc_Branches.csv")
Stanbic_Ibtc_Branches
skim(Stanbic_Ibtc_Branches)

geo_reverse_tbl <- Stanbic_Ibtc_Branches %>%
#to get the address from the lat and lon
  tidygeocoder::reverse_geocode(
    lat =lat,
    lon = long,
    method ="osm"
  )
#to get the map view
stanbic_branches_sf <- geo_reverse_tbl %>% 
  st_as_sf(
    coords = c("long", "lat"), # if its one you use select(-x)
    crs = 4326
  )
mapview(stanbic_branches_sf)

stanbic_branches_sf %>% 
  leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>% 
  addProviderTiles(providers$Stadia.StamenTonerLite, group = "Toner Lite") %>% 
  addLayersControl(baseGroups = c("Toner Lite", "World Imagery")) %>% 
  addMarkers(label = stanbic_branches_sf$BRANCH.UPDATED,
             clusterOptions = markerClusterOptions(),
             popup = ifelse(stanbic_branches_sf$State != NA,
                            stanbic_branches_sf$State,
                            "Not sure of the bank's location"))

