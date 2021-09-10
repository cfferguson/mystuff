pacman::p_load(tidyverse)

## "get up in the morning" %>%
##   "drink a lot of coffee" %>%
##   "come to work" %>%
##   "do stuff" %>%
##   "go home "%>%
##   "eat" %>%
##   "sleep (maybe)"


starwars %>%
  select(name, species, homeworld) %>% 
  head()



starwars %>%
  select(name, species, homeworld) %>%
  count(species)


starwars %>%
  select(name, species, homeworld) %>%
  count(species, homeworld)

starwars %>%
  select(name, species, homeworld) %>%
  count(species, homeworld) %>%
  arrange(-n)

sw_counts <- 
  starwars %>%
  select(name, species, homeworld) %>%
  count(species) 

ggplot(data = sw_counts, 
       aes(x = species, y = n)) + 
  geom_bar(stat = "identity")

sw_filtered <- starwars %>%
  select(name, species, homeworld) %>%
  count(species, homeworld) %>%
  filter(species %in% c("Human", "Droid", "Gungan"))

ggplot(data = sw_filtered, 
       aes(
         x = species, 
         y = n
         )
       ) + 
  geom_bar(stat = "identity")


ggplot(data = sw_filtered, 
       aes(
         x = species, 
         y = n,
         fill = n
         )
       ) + 
  geom_bar(stat = "identity")

ggplot(data = sw_filtered, 
       aes(
         x = species, 
         y = n,
         fill = species
         )
       ) + 
  geom_bar(stat = "identity")

ggplot(data = sw_filtered, 
       aes(
         x = species, 
         y = n,
         fill = n
         )
       ) + 
  geom_bar(stat = "identity") +
  facet_wrap(n ~ .)


## voter_fraud <- read_csv("2012_Voter_Fraud.csv")



voter_fraud %>%
  select(total) 



voter_fraud %>%
  summarize(Average = mean(total))



voter_fraud %>%
  summarize(Average = median(total))


# Doesn't work!
voter_fraud %>%
  summarize(Average = mode(total))



Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Notice that 'Mode' is capitalized so that R won't confuse it
# with its internal command 'mode'.



voter_fraud %>%
  summarize(Average = Mode(total))

