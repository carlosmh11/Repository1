
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


# READING AND WRITTING (FILES) ---------------------------------------------

f_raw<-jsonlite::fromJSON(url_)
df_source<-f_raw$ListaEESSPrecio %>% glimpse()
df<-df_source %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ","))

locale()


# CREATING A NEW VARIABLES -------------------------------------------------

df_low<-df %>% mutate(expensive = !rotulo %in% c("CEPSA", "REPSOL", "BP", "SHELL"))

df_low %>% select(precio_gasoleo_a,idccaa, rotulo, expensive) %>% drop_na() %>% group_by(idccaa, expensive) %>% summarise(mean(precio_gasoleo_a)) %>% view()

df21915299<-df_low%>%select(precio_gasoleo_a,idccaa,rotulo,expensive)%>%drop_na()%>%group_by(idccaa,expensive)%>%summarise(mean(precio_gasoleo_a))%>%data.frame("Comunidades"= c("Andalucia","Aragón","Principado de Asturias","Islas Baleares","Canarias","Cantabria","CastillaLeon","CastillaLaMancha","Cataluña","ComunidadValenciana","Extremadura","Galicia","Madrid","Murcia","Navarra","Paisvasco","Rioja","Ceuta","Melilla"))

# readr::