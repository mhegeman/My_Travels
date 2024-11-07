library(tidyverse)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggspatial)
library(leaflet)
library(ggthemes)
library(ggmap)
library(maptiles)


city_file <- "data/map_points_2024-11-06.csv"
city_data <- read_csv(city_file) |>
  janitor::clean_names()


# create point geometries from city_data

city_data_points <- city_data %>%
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326)

home <- city_data_points %>%
  filter(type == "Home")

away <- city_data_points %>%
  filter(type == "Away")

leaflet(home) |>
  addProviderTiles(providers$CartoDB.Positron)


