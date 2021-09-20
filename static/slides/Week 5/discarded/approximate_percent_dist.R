
# Approximate Percent Distribution

```{r echo=FALSE, fig.align='center'}
initial_mean <- 0
initial_sd <- 1
zscore_begin <- 2
zscore_end <- 3
zscore_critical <- 1.65

shading_col <- "#bde5f1"

x <- seq(from = initial_mean - 4*initial_sd, 
         to = initial_mean + 4*initial_sd , 
         by = 0.01)

nc_df <- data.frame(x = x, 
                    y = dnorm(x, 
                              mean = initial_mean, 
                              sd = initial_sd)) %>%
  mutate(cum_density = cumsum(y)) 

fill_uc <- function(nc_df, 
                    zscore_begin, 
                    zscore_end, 
                    fill = "red", 
                    alpha = 1){
  geom_area(data = subset(nc_df, x >= initial_mean + zscore_begin*initial_sd
                          & x < initial_mean + zscore_end*initial_sd),
            aes(y = y), 
            fill = fill, 
            color = NA, 
            alpha = alpha)
}

nc_df_filtered <-
  nc_df %>%
  filter(x %in% c(-3.00, -2.58, -2.00, -1.65, -1.00, -0.50, 0.00, 0.50, 1.00, 1.65, 2.00, 2.58, 3.00)) %>%
  mutate(cum_density = case_when(
    cum_density > 49 & cum_density < 51 ~ 50.000000,
    TRUE ~ cum_density
  )
  )

ggplot(nc_df, aes(x = x, y = y)) + 
  geom_line(color = "#ffffff") +
  fill_uc(nc_df = nc_df, 
          zscore_begin = -1, 
          zscore_end = 1, 
          fill = "#5bc0de", 
          alpha = 1) +
  fill_uc(nc_df = nc_df,
          zscore_begin = 1, 
          zscore_end = 2, 
          fill = "#8cd2e7", 
          alpha = 1) +
  fill_uc(nc_df = nc_df, 
          zscore_begin = -2, 
          zscore_end = -1, 
          fill = "#8cd2e7", 
          alpha = 1) +
  fill_uc(nc_df = nc_df, 
          zscore_begin = 2, 
          zscore_end = 6, 
          fill = "#bde5f1", 
          alpha = 1) +
  fill_uc(nc_df = nc_df, 
          zscore_begin = -3, 
          zscore_end = -2, 
          fill = "#bde5f1", 
          alpha = 1) +
  scale_x_continuous(breaks = -4:4) +
  scale_y_continuous(breaks = NULL) +
  theme_classic() +
  ylab("") + 
  xlab("") + 
  geom_text(data = nc_df_filtered,
            aes(x = x, 
                y = y + 0.1, 
                label = paste(round2(cum_density, 1),"%")),
            color = "#ffffff",
            nudge_x = 0,
            nudge_y = 0,
            check_overlap = TRUE,
            family = "roboto",
            size = 6) +
  geom_segment(data = nc_df_filtered,
               aes(x = x, 
                   xend = x, 
                   y = 0, 
                   yend = y), 
               linetype = "dashed",
               color = "#ffffff") +
  theme_void(base_family = "roboto") +
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "#212121",
                                    color = NA),
    plot.background = element_rect(fill = "#212121",
                                   color = NA)
  )
```