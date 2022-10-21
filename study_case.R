# CASE STUDY
## 21915299
browseURL("https://github.com/carlosmh11/Repository1")

if (!require("pacman")) install.packages("pacman")
pacman::p_load(pacman, magrittr, productplots, psych, RColorBrewer, tidyverse)

# LOAD AND PREPARE DATA ------------------------------------------------------
browseURL("http://j.mp/37Wxvv7")
df <- happy %>% as_tibble()
levels(df$happy)
# Reverser levels
df %<>% mutate(happy=fct_rev(happy))

# OUTCOME VARIABLES : HAPPINESS ----------------------------------------------
df %>% ggplot()+geom_bar(aes(happy, fill = happy))+
  theme(axis.title.x = element_blank(), legend.position = "none")

# Frequencies for happy ------------------------------------------------------
df %>% count(happy)
df %<>% select(happy:health) %>% view()
df %<>% filter(!is.na(happy))

# HAPPINESS AND GENDER -------------------------------------------------------
df %>% ggplot(aes(sex, fill = happy))+geom_bar(position = "fill")

# DICHOTOMUS MARRIED / NOT VARIABLE ------------------------------------------

df %<>% mutate(married = if_else(marital=="married", "yes", "no")) %>% 
  mutate(married = as_factor(married)) %>% view()
