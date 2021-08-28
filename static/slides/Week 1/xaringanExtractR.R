# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# library(knitr)

# purl("Slides-Week-1.Rmd")
# purl("Slides-Week-1R.Rmd")
pagedown::chrome_print("Slides-Week-1.html")

