
library(tidyverse)
library(mosaic)
library(ggplot2movies)


head(movies)

dim(movies)

names(movies)


movies %>%
  select(Action, Animation, Comedy,
         Drama, Documentary, Romance, Short) %>%
  pivot_longer(
    everything(),
    names_to = "genre"
  )

select_movies <- movies %>%
  select(Action, Animation, Comedy, Drama, Documentary, Romance, Short) %>%
  pivot_longer(
    everything(),
    names_to = "genre"
  )

select_movies

?pivot_longer


juniors_multiple <- tribble(
  ~ "baker", ~"cinnamon_1", ~"cardamom_2", ~"nutmeg_3",
  "Emma", 1L,   0L, 1L,
  "Harry", 1L,   1L, 1L, 
  "Ruby", 1L,   0L, 1L, 
  "Zainab", 0L, NA, 0L
)

juniors_multiple

juniors_multiple %>% 
  knitr::kable() %>%
  kableExtra::row_spec(0, background = "#212121") %>%
  kableExtra::row_spec(2, background = "#212121") %>%
  kableExtra::row_spec(4, background = "#212121") 


juniors_multiple %>%
  pivot_longer(-baker,
                names_to = c('spice', 'order'),
                names_sep = '_',
                values_to = 'correct')



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

glimpse(juniors_multiple_full)

# Does not work
juniors_multiple_full %>%
  pivot_longer(score_1:guess_3,
               names_to = c('score', 'guess'),
               names_sep = "_",
               values_to = 'correct')

# Correction
juniors_multiple_full %>% 
  # Don't do anything with the baker column
    pivot_longer(-baker, 
                 # Treat all columns the same and order them
                 names_to = c(".value", "order"), 
                 # Control how the column names are broken up
                 names_sep = "_")
