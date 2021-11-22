# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(knitr)

purl("Descriptive-statistics-in-R.Rmd")
purl("Statistical-Tests-in-R.Rmd")
