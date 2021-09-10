setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)

init <- read_csv("NFL_fandom_data-surveymonkey.csv",
                   show_col_types = FALSE) %>%
        mutate_all(replace_na, replace = 0); init

write_csv(init, "teampolview.csv")


