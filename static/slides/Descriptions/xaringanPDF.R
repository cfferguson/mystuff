# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# library(xaringanBuilder)
# build_pdf("Slides-MRE.Rmd")
# build_pdf("Slides-MRE.html")
# build_pdf("Slides-Week-Descriptives.Rmd")
# build_pdf("Slides-Week-Descriptives.html")

# pagedown::chrome_print("Slides-MRE.Rmd")
# pagedown::chrome_print("Slides-MRE.html")
# pagedown::chrome_print("Slides-Week-3R.Rmd")
# pagedown::chrome_print("Slides-Week-Descriptives.Rmd")
# pagedown::chrome_print("Slides-Week-Descriptives.html")

remotes::install_github("rstudio/chromote")
source("https://git.io/xaringan2pdf")
xaringan_to_pdf("Descriptive-statistics-in-R.html")
xaringan_to_pdf("Statistical-Tests-in-R.html")

