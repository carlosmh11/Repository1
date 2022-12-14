

# DATA INGESTION -------------------------------------------------------

## Kaggle API


# LOAD LIBS ----------------------------------------------

if(!require("pacman")) install.packages("pacman")
p_load(tidyverse, magrittr, janitor, lubridate, tidyr)


# CLEAN AND FORMATTING -------------------------------------------------
m<-read_csv("ml-25m/movies.csv") %>% as_tibble()
r<-read_csv("ml-25m/ratings.csv") %>% as_tibble()
t<-read_csv("ml-25m/tags.csv") %>% as_tibble()
l<-read_csv("ml-25m/links.csv") %>% as_tibble()

# STATS, EDA, PLAYING AROUND -------------------------------------------
r %>% glimpse()
t %<>% mutate(timestamp=as_datetime(timestamp))
r %<>% mutate(timestamp=as_datetime(timestamp))
m %>% glimpse()

m %>% tidyr::extract(title, c("title1","year"), "(.*) \\(([0-9]*)", remove = F)

