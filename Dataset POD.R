
# LOADING LIBS -------------------------------------------------------------

install.packages(c("tidyverse","httr","jonitor"))
library(tidyverse, httr)


# BASIC OPERATIONS ---------------------------------------------------------

df<-httr::GET("https://github.com/carlosmh11/LPE21915299/blob/main/uefa_dataset.csv")
View(uefa_dataset)
