# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# library(xaringanBuilder)
# build_pdf("Slides-Week-8.Rmd")
# build_pdf("Slides-Week-8.html")

# pagedown::chrome_print("Slides-Week-8.Rmd")
# pagedown::chrome_print("Slides-Week-8.html")
# pagedown::chrome_print("Slides-Week-8R.Rmd")

remotes::install_github("rstudio/chromote")
source("https://git.io/xaringan2pdf")
xaringan_to_pdf("Slides-Week-8.html")
xaringan_to_pdf("Slides-Week-8R.html")
