# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(knitr)

# purl("Slides-Week-2.Rmd")
purl("Slides-Week-2R.Rmd")
