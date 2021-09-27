# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# library(xaringanBuilder)
# build_pdf("Slides-MRE.Rmd")
# build_pdf("Slides-MRE.html")

# pagedown::chrome_print("Slides-MRE.Rmd")
# pagedown::chrome_print("Slides-MRE.html")
# pagedown::chrome_print("Slides-Week-3R.Rmd")

remotes::install_github("rstudio/chromote")
source("https://git.io/xaringan2pdf")
xaringan_to_pdf("Slides-MRE.html")
xaringan_to_pdf("Slides-Week-Descriptives.html")
