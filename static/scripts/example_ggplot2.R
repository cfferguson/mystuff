library(hrbrthemes)
library(gcookbook)
library(tidyverse)


ggplot(uspopage,
       aes(x = Year, 
           y = Thousands, 
           fill = AgeGroup)) + 
  geom_area() +
  scale_fill_viridis_d() +
 # scale_fill_ipsum() +
  scale_x_continuous(expand=c(0,0)) +
  scale_y_comma() +
  labs(title="Age distribution of population in the U.S., 1900-2002",
       caption="Source: R Graphics Cookbook") +
  theme_ipsum_rc(grid="XY") +
  theme(axis.text.x = element_text(hjust=c(0, 0.5, 0.5, 0.5, 1)),
        legend.position = "bottom") +
  guides(fill = guide_legend(title = "Age Range", 
                             title.position = "top",
                             title.hjust = 0.5))
