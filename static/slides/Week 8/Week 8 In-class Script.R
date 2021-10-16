library(tidyverse)
library(ggplot2movies)
library(mosaic)

movies %>%
  select(title,
         Action, Animation, Comedy,
         Drama, Documentary, Romance, Short) %>%
  select(-title) %>%
  pivot_longer(
    everything(),
    names_to = "genre"
  ) -> select_movies

select_movies

juniors_multiple <- tribble(
  ~ "baker", ~"cinnamon_1", ~"cardamom_2", ~"nutmeg_3",
  "Emma", 1L,   0L, 1L,
  "Harry", 1L,   1L, 1L, 
  "Ruby", 1L,   0L, 1L, 
  "Zainab", 0L, NA, 0L
)

juniors_multiple %>%
  pivot_longer(-baker,
               names_to = c("spice", "order"),
               values_to = "banana",
               names_sep= "_"
  )

glimpse(juniors_multiple)


juniors_multiple_full <- tribble(
  ~ "baker", ~"score_1", ~"score_2", ~"score_3", 
  ~ "guess_1", ~"guess_2", ~"guess_3",
  "Emma", 1L,   0L, 1L, "cinnamon", "cloves", "nutmeg",
  "Harry", 1L,   1L, 1L, "cinnamon", "cardamom", "nutmeg",
  "Ruby", 1L,   0L, 1L, "cinnamon", "cumin", "nutmeg",
  "Zainab", 0L, NA, 0L, "cardamom", NA_character_, "cinnamon"
)

juniors_multiple_full

juniors_multiple_full %>% 
  pivot_longer(score_1:guess_3,
               names_to = c('score', 'guess'),
               names_sep = "_",
               values_to = 'correct')

juniors_multiple_full %>% 
  pivot_longer(score_1:guess_3,
               names_to = c(".value", "order"),
               names_sep = "_")


movies_by_genre <- 
  movies %>%
  select(Action, Animation, Comedy,
         Drama, Documentary, Romance, Short) %>%
  pivot_longer(everything(),
               names_to = "genre") %>%
  group_by(genre) %>%
  tally(value)

movies_by_genre

ggplot(movies_by_genre,
       aes(x = genre, 
           y = n, 
           fill = -n)) +
  geom_bar(stat='identity', 
           show.legend = FALSE) +
  labs(title = "Count of Genre", x = "Genre", y = "Count") +
  theme_minimal()
