library(tidyverse)
library(gcookbook)
library(ggthemes)

climate_sub <- 
  climate %>%
  filter(Source == "NASA" & Year >= 1900) %>%
  mutate(pos = Anomaly10y >= 0) 

ggplot(climate_sub, 
       aes(x = Year, 
           y = Anomaly10y, 
           fill = pos)) +
  geom_col(position = "identity",
           color = "#FFFFFF",
           show.legend = FALSE) +
  scale_fill_manual(values = c("#d9534f", "#428bca", "#eef3f8")) + 
  theme_minimal() +
  theme(plot.title = element_text(color = "#5a5255",
                                  size = 20,
                                  face = "bold"),
        plot.caption = element_text(face = "italic"),
        axis.title.x = element_text(margin = margin(t = 15, 
                                                    b = 10),
                                    color = "#5a5255",
                                    size = 12),
        axis.title.y = element_text(margin = margin(r = 15),
                                    color = "#5a5255",
                                    size = 12)) +
  ylab("Temperature Anomaly (°C)") +
  labs(title = "Ten Year Global Temperature Anomalies 1900-2011",
       caption = "An anomaly is the difference from the baseline temperature calulated by taking the mean of the yearly temperatures from 1951-1980")
