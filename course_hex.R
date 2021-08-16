# Graphic for the bottom of the main page 

# Set the working directory as source ----
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Remove objects ----
rm(list = ls())

# Libraries
library(tidyverse)
library(RColorBrewer)
library(ggridges)
library(hexSticker)
library(wesanderson)
library(showtext)
font_add_google("Roboto Condensed", "roboto")
font_add("Futura", "Futura-CondensedMedium.ttf")
showtext_auto()

# Create data (this takes more sense with a numerical X axis)
x <- 
  seq(0, 2*pi, length.out=120)

model <- 
  data.frame(
  x=x, 
  y=sin(-x) + 
    rnorm(480, 
          sd=0.18)
) %>%
  as_tibble()

# Conditional coloring
set <- 
  model %>% 
  mutate(colorchoice = ifelse(y > 0, 
                              "type1", 
                              "type2"))

# plot
sin_w <- 
  ggplot(set, aes(x=x, y=y)) +
  geom_segment(aes(x=x, xend=x, y=0, yend=y, color=y), 
                size=0.09, 
                alpha=0.3,
               show.legend = FALSE) +
  scale_color_gradient(low = "#ff5b77",
                       high = "#5bc0de") +
  theme_void(); sin_w

sin_light <- 
  ggplot(set, aes(x=x, y=y)) +
  geom_segment(aes(x=x, xend=x, y=0, yend=y, color=y), 
               size=0.09, 
               alpha=0.3,
               show.legend = FALSE) +
  scale_color_gradient(low = "#ff0f38",
                       high = "#28a1c5") +
  theme_void(); sin_light

slack_icon <-
  sin_w +
  theme(panel.background = element_rect(fill = "#292A30",
                                        color = "#293840")); slack_icon
  
ggsave(slack_icon,
       file="slack_icon.png",
       width = 210,
       height = 210,
       units = "mm"
      )
  
  
sticker(sin_w, 
        package="EDP 613", 
        p_size=14.5, 
        p_x=0.67,
        p_y=1.36,
        s_x=1.0, 
        s_y=1.0, 
        s_width=1.5, 
        s_height=1.5,
        h_fill="#292A30",
        h_color="#293840",
        p_family = "Futura",
        filename="course_hex.png")

sticker(sin_w, 
        package="", 
        p_size=9.5, 
        s_x=1.0, 
        s_y=1.0, 
        s_width=1.5, 
        s_height=1.5,
        h_fill="#292A30",
        h_color="#293840",
        filename="icon.png")

