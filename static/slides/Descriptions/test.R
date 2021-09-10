googleico <- png::readPNG(here::here("static", "logos", "google.png"))

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
              image = spec_image(
                c(googleico, 
                  googleico), 
                50, 
                50))