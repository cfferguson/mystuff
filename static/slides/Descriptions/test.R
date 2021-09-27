# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(knitr)
library(kableExtra)

tibble(
  
  search = c("R ggplot fill aesthetic",
             "R ggplot fill aesthetic Stackoverflow"),
  
  link = c("",
           ""),
  
  .name_repair = "minimal"
  
) %>%
  
  kbl(col.names = c("Search terms", "Direct link"),
      "html", 
      escape = FALSE,
      align = "lc") %>%
  column_spec(2,
              image = 
                spec_image(c("google.png", "google.png"), 50, 50)
  ) 
