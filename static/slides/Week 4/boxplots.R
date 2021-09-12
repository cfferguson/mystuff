setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(showtext)
font_add_google("Roboto Condensed", "roboto")
showtext_auto()

timings <- 
  tibble(
    
    col1 = c(15,19,20,21,23),
    
    col2 = c(17,19,20,21,24),
    
    col3 = c(17,19,20,21,26),
    
    col4 = c(17,19,21,22,31),
    
    col5 = c(17,19,21,22,36),
    
    col6 = c(18,20,21,22,38),
    
    col7 = c(19,20,21,23,39)
    
  ) %>%
  gather(key,
         value) %>%
  select(-key) %>%
  add_column(thing = "banana") %>%
  ggplot(aes(x = thing,
             y = value,
             fill = factor(thing))) + 
  scale_fill_manual(values = "#5bc0de") +
  geom_boxplot(width = 0.6,
               show.legend = FALSE,
               color = "#ffffff") +
  stat_boxplot(geom ='errorbar', 
               width = 0.1,
               color = "#ffffff") +
  stat_summary(geom="text",
               fun = quantile,
               color = "#ffffff",
               aes(x = thing,
                   y = value,
                   label = sprintf("%1.1f", 10^..y..), 
                   color = thing),
               position = position_nudge(x=0.45), 
               size = 5.5,
               show.legend = FALSE) +
  scale_y_log10() +
  coord_flip(xlim = c(0, 2),
             ylim = ) +
  theme_void() +
  theme_void(base_family = "roboto") +
  theme(plot.background = element_rect(fill = "#212121", 
                                       color = "#212121")) +
  expand_limits(y=c(NA, 21))

timings

ggsave(
  timings,
  file="timings.pdf", 
  bg="transparent",
  device = cairo_pdf,
  width = 297,
  height = 210,
  units = "mm"
)

#--

espresso <- 
  tibble(
    
    col1 = c(14,14),
    
    col2 = c(43,25),
    
    col3 = c(38,26),
    
    col4 = c(44,9),
    
    col5 = c(31,46),
    
    col6 = c(27,30),
    
    col7 = c(39,24),
    
    col8 = c(59,41),
    
    col9 = c(9,26),
    
    col10 = c(10,27),
    
    col11 = c(54,14)
    
  ) %>%
  gather(key,
           value) %>%
  select(-key) %>%
  add_column(thing = "banana") %>%
  ggplot(aes(x = thing,
             y = value,
             fill = factor(thing))) + 
  scale_fill_manual(values = "#5bc0de") +
  geom_boxplot(width = 0.6,
               show.legend = FALSE,
               color = "#ffffff") +
  stat_boxplot(geom ='errorbar', 
               width = 0.1,
               color = "#ffffff") +
  stat_summary(geom="text",
               fun = quantile,
               color = "#ffffff",
               aes(x = thing,
                   y = value,
                   label = sprintf("%1.1f", 10^..y..), 
                   color = thing),
               position = position_nudge(x=0.45), 
               size = 5.5,
               show.legend = FALSE) +
  scale_y_log10() +
  coord_flip(xlim = c(0, 2),
             ylim = ) +
  theme_void() +
  theme_void(base_family = "roboto") +
  theme(plot.background = element_rect(fill = "#212121", 
                                       color = "#212121")) +
  expand_limits(y=c(NA, 21))

espresso

ggsave(
  espresso,
  file="espresso.pdf", 
  bg="transparent",
  device = cairo_pdf,
  width = 297,
  height = 210,
  units = "mm"
)
