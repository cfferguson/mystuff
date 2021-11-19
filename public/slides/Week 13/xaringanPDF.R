# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# library(xaringanBuilder)
# build_pdf("Slides-Week-13.Rmd")
# build_pdf("Slides-Week-13.html")

# pagedown::chrome_print("Slides-Week-13.Rmd")
# pagedown::chrome_print("Slides-Week-13.html")
# pagedown::chrome_print("Slides-Week-13R.Rmd")

remotes::install_github("rstudio/chromote")
source("https://git.io/xaringan2pdf")
xaringan_to_pdf("Slides-Week-13.html")
xaringan_to_pdf("Slides-Week-13R.html")
