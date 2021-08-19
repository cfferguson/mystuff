## ----eval = TRUE, echo = FALSE------------------------------------
unchecked <- as.character(fontawesome::fa("square", fill = "#b2d8d8"))

checked <- as.character(fontawesome::fa("check", fill = "#ffffff"))


## ----eval = TRUE, echo = FALSE------------------------------------

qualquanid <- 
  tibble(
    
    Item <- c("1","2","3","4"),
    
    Situation <- c("The name of the schools in your district.",
                   "The number of schools in your district.",
                   "The amount of each ingredient in a cake.",
                   "The ingredients in a cake."),
    
    Type <- c("",
              "",
              "",
              ""),
    
      .name_repair = "minimal"
    
)



## ---- echo=FALSE--------------------------------------------------
qualquanid %>%
  kbl(col.names = c("", "Situation", "Type"), 
      "html", 
      escape = FALSE,
      align = 'cll') %>%
  kable_styling(full_width = FALSE) %>%
  column_spec(1, width = "5em") %>%
  column_spec(2, width = "40em") %>%
  column_spec(3, width = "20em") %>%
  row_spec(0, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(1, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(2, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(3, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(0, background = "#212121") %>%
  row_spec(2, background = "#212121") %>%
  row_spec(4, background = "#212121")


## ----eval = TRUE, echo = FALSE------------------------------------

qualquanidsol <- 
  tibble(
    
    Item <- c("1","2","3","4"),
    
    Situation <- c("The name of the schools in your district.",
                   "The number of schools in your district.",
                   "The amount of each ingredient in a cake.",
                   "The ingredients in a cake."),
    
    Type <- c("Qualitative",
              "Quantitative",
              "Quantitative",
              "Qualitative"),
    
      .name_repair = "minimal"
    
)
  


## ---- echo=FALSE--------------------------------------------------
qualquanidsol %>%
  kbl(col.names = c("", "Situation", "Type"), 
      "html", 
      escape = FALSE,
      align = 'cll') %>%
  kable_styling(full_width = FALSE) %>%
  column_spec(1, width = "5em") %>%
  column_spec(2, width = "40em") %>%
  column_spec(3, width = "20em") %>%
  row_spec(0, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(1, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(2, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(3, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(0, background = "#212121") %>%
  row_spec(2, background = "#212121")  %>%
  row_spec(4, background = "#212121")


## ----eval = TRUE, echo = FALSE------------------------------------

levels <- 
  tibble(
  
  Characteristic <- c("Naming, labeling, or classifying observations", 
                    "Ranks categories in order",
                    "Known equal intervals",
                    "Includes a natural zero point"),
  
  Nominal <- c(checked,
               "",
               "",
               ""),
  
  Ordinal <- c(checked,
               checked,
               "",
               ""),
  
  Interval <- c(checked,
                checked,
                checked,
                ""),
  
  Ratio <- c(checked,
             checked,
             checked,
             checked),
  
  .name_repair = "minimal"
  
)
  


## ---- echo=FALSE--------------------------------------------------
levels %>%
  kbl(col.names = c("", "Nominal", "Ordinal", "Interval", "Ratio"), 
      "html", 
      escape = FALSE,
      align = 'cccc') %>%
  kable_styling(full_width = FALSE) %>%
  column_spec(1, width = "5em") %>%
  column_spec(2, width = "20em") %>%
  column_spec(3, width = "20em") %>%
  column_spec(4, width = "20em") %>%
  column_spec(5, width = "20em") %>%
  row_spec(0, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(1, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(2, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(3, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(0, background = "#212121") %>%
  row_spec(2, background = "#212121")  %>%
  row_spec(4, background = "#212121")


## ----eval = TRUE, echo = FALSE------------------------------------

nomordir <- 
  tibble(
    
    Item <- c("1","2","3","4","5"),
    
    Situation <- c("The (typical) letter grade distribution in a school",
                   "Toppings on a cheeseburger",
                   "Social economic status",
                   "A telephone number",
                   "Time"),
    
      Type <- c("",
              "",
              "",
              "",
              ""),
    
      .name_repair = "minimal"
    
)
  


## ---- echo=FALSE--------------------------------------------------
nomordir %>%
  kbl(col.names = c("", "Situation", "Type"), 
      "html", 
      escape = FALSE,
      align = 'cll') %>%
  kable_styling(full_width = FALSE) %>%
  column_spec(1, width = "5em") %>%
  column_spec(2, width = "40em") %>%
  column_spec(3, width = "20em") %>%
  row_spec(0, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(1, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(2, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(3, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(0, background = "#212121") %>%
  row_spec(2, background = "#212121")  %>%
  row_spec(4, background = "#212121")


## ----eval = TRUE, echo = FALSE------------------------------------

nomordir_sol <- 
  tibble(
    
    Item <- c("1","2","3","4","5"),
    
    Situation <- c("The (typical) letter grade distribution in a school",
                   "Toppings on a cheeseburger",
                   "Social economic status",
                   "A telephone number",
                   "Time"),
    
    Type <- c("Ordinal",
              "Nominal",
              "Ordinal",
              "Ordinal",
              "Interval Ratio"),
    
      .name_repair = "minimal"
    
)
  


## ---- echo=FALSE--------------------------------------------------
nomordir_sol %>%
  kbl(col.names = c("", "Situation", "Type"), 
      "html", 
      escape = FALSE,
      align = 'cll') %>%
  kable_styling(full_width = FALSE) %>%
  column_spec(1, width = "5em") %>%
  column_spec(2, width = "40em") %>%
  column_spec(3, width = "20em") %>%
  row_spec(0, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(1, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(2, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(3, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(0, background = "#212121") %>%
  row_spec(2, background = "#212121")  %>%
  row_spec(4, background = "#212121")


## ----eval = TRUE, echo = FALSE------------------------------------

disccont <- 
  tibble(
    
    Item <- c("1","2","3","4"),
    
    Situation <- c("Time it takes to get to school",
                   "Water temperature",
                   "Ratings on a 5-point rating scale",
                   "Number of cars currently in a parking lot"),
    
    Type <- c("",
              "",
              "",
              ""),
    
      .name_repair = "minimal"
    
)
  


## ---- echo=FALSE--------------------------------------------------
disccont %>%
  kbl(col.names = c("", "Situation", "Type"), 
      "html", 
      escape = FALSE,
      align = 'cll') %>%
  kable_styling(full_width = FALSE) %>%
  column_spec(1, width = "5em") %>%
  column_spec(2, width = "40em") %>%
  column_spec(3, width = "20em") %>%
  row_spec(0, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(1, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(2, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(3, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(0, background = "#212121") %>%
  row_spec(2, background = "#212121")  %>%
  row_spec(4, background = "#212121")


## ----eval = TRUE, echo = FALSE------------------------------------

disccont_sol <- 
  tibble(
    
    Item <- c("1","2","3","4"),
    
     Situation <- c("Time it takes to get to school",
                   "Water temperature",
                   "Ratings on a 5-point rating scale",
                   "Number of cars currently in a parking lot"),
    
    Type <- c("Continuous",
              "Continuous",
              "Discrete",
              "Discrete"),
    
      .name_repair = "minimal"
    
)
  


## ---- echo=FALSE--------------------------------------------------
disccont_sol %>%
  kbl(col.names = c("", "Situation", "Type"), 
      "html", 
      escape = FALSE,
      align = 'cll') %>%
  kable_styling(full_width = FALSE) %>%
  column_spec(1, width = "5em") %>%
  column_spec(2, width = "40em") %>%
  column_spec(3, width = "20em") %>%
  row_spec(0, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(1, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(2, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(3, extra_css = 'vertical-align: middle !important;') %>%
  row_spec(0, background = "#212121") %>%
  row_spec(2, background = "#212121") %>%
  row_spec(4, background = "#212121") 

