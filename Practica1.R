options(max.print=100000)
pacman::p_load(httr,tidiverse,leaflet,janitor,readr,sparklyr)
url<- "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
httr::GET(url)
library(tidyverse)
library(readr)
library(leaflet)
library(sparklyr)
library(httr)

#Gasoleo A. Top 10 m?s caras
df %>% select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localidad, direccion) %>%
  top_n(10, precio_gasoleo_a) %>%
  leaflet() %>% addTiles() %>%
  addCircleMarkers(lng = ~longitud_wgs84, lat = ~latitud, popup = ~rotulo, label = ~precio_gasoleo_a)

#Gasoleo A. Top 10 m?s baratas La Rioja
df %>% filter(provincia == "RIOJA (LA)") %>% select(rotulo, latitud, longitud_wgs84, precio_gasoleo_a, localidad, direccion) %>%
  top_n(-10, precio_gasoleo_a) %>%
  leaflet() %>% addTiles() %>%
  addCircleMarkers(lng = ~longitud_wgs84, lat = ~latitud, popup = ~rotulo, label = ~precio_gasoleo_a)



