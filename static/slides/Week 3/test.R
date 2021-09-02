# library(moments)
library(patchwork)
library(showtext)
font_add_google("Roboto Condensed", "roboto")
showtext_auto()

set.seed(13457)
pop = 10000
no_of_bins = 1/100

# Normal distribution ----
noskew = rbeta(pop, 
               shape1 = 26, 
               shape2 = 26, 
               ncp = 0)
noskew_tib <- tibble(sid = 1:pop,
                     spop = noskew)
# noskew_skval = round(skewness(noskew),3) 

norm_dist <- 
  ggplot(noskew_tib, 
         aes(spop)) + 
  geom_histogram(binwidth = no_of_bins,
                 aes(fill = ..count..),
                 show.legend = FALSE) +
  scale_fill_distiller(palette = "Spectral") +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    
  ) +
  theme_void(base_family = "roboto") +
  theme(plot.background = element_rect(fill = "#212121", 
                                       color = "#212121"),
        plot.title = element_text(hjust = 0.50,
                                  color = "#FFFFFF"),
        panel.background = element_rect(fill = NA,
                                        color = NA)) +
  ggtitle("mean = median = mode") +
  stat_function(fun = function(x) dnorm(x, 
                                        mean = mean(noskew), 
                                        sd = sd(noskew)) * pop * no_of_bins,
                color = "#FFFFFF", 
                size = 2,
                alpha = 0.9); norm_dist


# Left skewed distribution ----
leftskew <- rbeta(pop, 
                  shape1 = 18, 
                  shape2 = 2, 
                  ncp = 0)
leftskew_tib <- tibble(sid = 1:pop,
                       spop = leftskew)
# leftskew_skval = round(skewness(leftskew),3) 

leftskew_dist <- 
  ggplot(leftskew_tib, 
         aes(spop)) + 
  geom_histogram(binwidth = no_of_bins,
                 aes(fill = ..count..),
                 show.legend = FALSE) +
  scale_fill_distiller(palette = "Spectral") +
  theme(
    panel.background = element_rect(fill = "#212121"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  ) +
  theme_void(base_family = "roboto") +
  theme(plot.background = element_rect(fill = "#212121", 
                                       color = "#212121"),
        plot.title = element_text(hjust = 0.50,
                                  color = "#FFFFFF")) +
  ggtitle("mean < median < mode") +
  stat_function(fun = function(x) dnorm(x, 
                                        mean = mean(leftskew), 
                                        sd = sd(leftskew)) * pop * no_of_bins,
                color = "#FFFFFF", 
                size = 2,
                alpha = 0.9); leftskew_dist

# Right skewed distribution ----
rightskew <- rbeta(pop, 
                   shape1 = 2, 
                   shape2 = 18, 
                   ncp = 1)
rightskew_tib <- tibble(sid = 1:pop,
                        spop = rightskew)
# rightskew_skval = round(skewness(rightskew),3) 

rightskew_dist <- 
  ggplot(rightskew_tib, 
         aes(spop)) + 
  geom_histogram(binwidth = no_of_bins,
                 aes(fill = ..count..),
                 show.legend = FALSE) +
  scale_fill_distiller(palette = "Spectral") +
  theme(
    panel.background = element_rect(fill = "#212121"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  ) +
  theme_void(base_family = "roboto") +
  theme(plot.background = element_rect(fill = "#212121", 
                                       color = "#212121"),
        plot.title = element_text(hjust = 0.50,
                                  color = "#FFFFFF")) +
  ggtitle("mean > median > mode") +
  stat_function(fun = function(x) dnorm(x, 
                                        mean = mean(rightskew), 
                                        sd = sd(rightskew)) * pop * no_of_bins,
                color = "#FFFFFF", 
                size = 2,
                alpha = 0.9)

leftskew_dist / norm_dist / rightskew_dist

grid.rect(width = 0.99, 
          height = 0.99, 
          gp = gpar(lwd = 10, 
                    col = "#212121", 
                    fill = NA))

# -----
set.seed(13457)
n <- 10000
normal <- rnorm(n)

draws <- list(
  `Normal\nmean = median = mode` = normal,
  `Skewed Left\nmean < median < mode`  = c(normal[normal < 0] * 2.5, normal),
  `Skewed Right\nmean > median > mode` = c(normal[normal > 0] * 2.5, normal))

random_data <- 
  tibble::tibble(
    example = factor(names(draws), 
                     names(draws)), 
    values = draws
  ) %>%
  tidyr::unnest(values)

ggplot(random_data, aes(x = values)) + 
  geom_histogram(
    aes(y = after_stat(density),
        fill = after_stat(density)), 
    bins = 50, 
    show.legend = FALSE
  ) +
  scale_fill_distiller(palette = "Spectral") +
  stat_function(fun = dnorm, 
                color = "#FFFFFF", 
                size = 1.5,
                alpha = 0.9) +
  facet_wrap("example",
             scales = "free_x",
             nrow = 3) +
  theme_void(base_family = "roboto") +
  theme(plot.background = element_rect(fill = "#212121", 
                                       color = "#212121"),
        plot.title = element_text(hjust = 0.50,
                                  color = "#FFFFFF"),
        strip.text = element_text(hjust = 0.50,
                                  color = "#FFFFFF",
                                  size = 12)) 


