library(tidyverse)
library(mosaic)
library(ggplot2movies)
library(viridis)
library(patchwork)

  movies %>%
  select(Action, Animation, 
         Comedy, Drama, 
         Documentary, Romance, 
         Short) %>%
  pivot_longer(everything(),
               names_to = "genre") %>%
  group_by(genre) %>%
  tally(value)

movies %>%
  select(Action, Animation, 
         Comedy, Drama, 
         Documentary, Romance, 
         Short) %>%
  pivot_longer(everything(),
               names_to = "genre") %>%
  group_by(genre) %>%
  tally(value) %>%
  ggplot(aes(x = genre, 
           y = n, 
           fill = -n)) +
  geom_bar(stat='identity', 
           show.legend = FALSE) +
  labs(title = "Count of Genre", 
       x = "Genre", 
       y = "Count") +
  theme_minimal()

movies %>% 
  ggplot(aes(x = rating,
             fill = ..x..)) +
  geom_histogram(bins = 20,
                 show.legend = FALSE) +
  scale_fill_viridis(direction = -1) +
  theme_minimal()


pop_hist <-
movies %>% 
  ggplot(aes(x = rating,
             fill = ..x..)) +
  geom_histogram(bins = 20,
                 show.legend = FALSE) +
  scale_fill_viridis(direction = -1) +
  theme_minimal()


set.seed(123)

 movies %>% 
  sample_n(1000)


set.seed(123)

movies_sample <- 
  movies %>% 
  sample_n(1000)


ggplot(movies_sample, 
       aes(x = rating,
           fill = ..x..)) +
       geom_histogram(color = "white", 
                      bins = 20,
                      show.legend = FALSE) +
       scale_fill_viridis(direction = -1) +
       theme_minimal()

rand_sample <- 
  ggplot(movies_sample, 
         aes(x = rating,
             fill = ..x..)) +
  geom_histogram(color = "white", 
                 bins = 20,
                 show.legend = FALSE) +
  scale_fill_viridis(direction = -1) +
  theme_minimal()

movies_sample %>% 
   summarize(mean = mean(rating))

resample(movies_sample) %>%
  arrange(orig.id) %>% 
  summarize(mean = mean(rating))

do(10) * 
  (resample(movies) %>% 
     summarize(mean = mean(rating)))



  do(1000) *
  summarize(resample(movies), 
            mean = mean(rating))


not_tiny <- 
  do(1000) *
  summarize(resample(movies), 
            mean = mean(rating))



ggplot(not_tiny, 
       mapping = aes(x = mean,
                     fill = ..x..)) +
  geom_histogram(bins = 20, 
                 color = "white",
                 show.legend = FALSE) +
  scale_fill_viridis(direction = -1) +
  theme_minimal()


rep_sample <- 
  ggplot(data = not_tiny , 
         mapping = aes(x = mean,
                       fill = ..x..)) +
  geom_histogram(bins = 20, 
                 color = "white",
                 show.legend = FALSE) +
  scale_fill_viridis(direction = -1) +
  theme_minimal()



pop_hist + rand_sample + rep_sample


smaller_rand_samp <- 
movies %>% 
  sample_n(100) %>%
   ggplot(aes(x = rating,
              fill = ..x..)) +
   geom_histogram(color = "white", 
                  bins = 20,
                  show.legend = FALSE) +
   scale_fill_viridis(direction = -1) +
   theme_minimal()

so_tiny <-
do(100) *
  summarize(resample(movies), 
            mean = mean(rating))

smaller_rep_samp <-
ggplot(so_tiny,
         mapping = aes(x = mean,
                       fill = ..x..)) +
  geom_histogram(color = "white",
                 bins = 20,
                 show.legend = FALSE) +
  scale_fill_viridis(direction = -1) +
  theme_minimal()


pop_hist + smaller_rand_samp + smaller_rep_samp


bigger_rand_samp <- 
movies %>% 
  sample_n(10000) %>%
   ggplot(aes(x = rating,
              fill = ..x..)) +
   geom_histogram(color = "white", 
                  bins = 20,
                  show.legend = FALSE) +
   scale_fill_viridis(direction = -1) +
   theme_minimal()

more_not_tiny <-
do(10000) *
  summarize(resample(movies), 
            mean = mean(rating))

bigger_rep_samp <-
ggplot(more_not_tiny,
         mapping = aes(x = mean,
                       fill = ..x..)) +
  geom_histogram(color = "white",
                 bins = 20,
                 show.legend = FALSE) +
  scale_fill_viridis(direction = -1) +
  theme_minimal()



pop_hist + bigger_rand_samp + bigger_rep_samp


(way1 <- 
    starwars %>%
    head() %>%
    select(name, height, hair_color))


way2 <- 
    starwars %>%
    head() %>%
    select(name, height, hair_color); way2


confint(not_tiny, 
        level = 0.95, 
        method = "quantile")


confint(not_tiny, 
         level = 0.95, 
         method = "stderr")
