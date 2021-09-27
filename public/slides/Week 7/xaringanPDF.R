# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# library(xaringanBuilder)
# build_pdf("Slides-Week-5.Rmd")
# build_pdf("Slides-Week-5.html")

# pagedown::chrome_print("Slides-Week-5.Rmd")
# pagedown::chrome_print("Slides-Week-5.html")
# pagedown::chrome_print("Slides-Week-5R.Rmd")

remotes::install_github("rstudio/chromote")
source("https://git.io/xaringan2pdf")
xaringan_to_pdf("Slides-Week-7p1.html")
xaringan_to_pdf("Slides-Week-7p2.html")
xaringan_to_pdf("Slides-Week-7R.html")