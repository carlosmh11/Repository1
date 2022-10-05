
# GIT COMMANDS -------------------------------------------------------------

# git status
# git init#3git add
# git commit -m "message"
# git push -u origin main
# git branch -M
# git merge
# git remote add origin https://github...
# git clone https://github...
# git pull
# git fetch

# TERMINAL COMMANDS

# ls
# cd
# pwd
# cd ..
# mkdir
# touch
# nano
# less
# cat
# where
# which


# LOADING LIBS -------------------------------------------------------------

install.packages(c("tidyverse","httr","janitor"))
install.packages("janitor")
install.packages("pacman")
library(tidyverse, httr)
# dplyr::


# BASIC OPERATIONS ---------------------------------------------------------

# carlos <- 21
# clase lep <- c("juan","pepe","pablo")
df<-httr::GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
# glimpse(preciosEESS_es)


# GETTING DATA FROM INTERNET

url_<-"https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
res_<-httr::GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
xml2::read_xml(res_$content)

f_raw<-jsonlite::fromJSON(url_)
df_source<-f_raw$ListaEESSPrecio %>% glimpse()
janitor::clean_names(df_source)%>% glimpse()
type.convert(df_source,locale = )

# READING AND WRITTING (FILES) ---------------------------------------------

# readr::