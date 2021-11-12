# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# library(xaringanBuilder)
# build_pdf("Slides-Week-6.Rmd")
# build_pdf("Slides-Week-6.html")

# pagedown::chrome_print("Slides-Week-6.Rmd")
# pagedown::chrome_print("Slides-Week-6.html")
# pagedown::chrome_print("Slides-Week-6R.Rmd")

remotes::install_github("rstudio/chromote")
source("https://git.io/xaringan2pdf")
xaringan_to_pdf("Slides-Week-6.html")
xaringan_to_pdf("Slides-Week-6R.html")