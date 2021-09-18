# Run this as a shortcut to Set Working Directory > To source File Location
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Not necessary but nice color palette 
# install.packages("viridis", dependencies = TRUE)
library(viridis)
library(patchwork)

# Some nice place to get and create color palettes using rbg or hex : 
# https://www.color-hex.com/
# https://coolors.co/
# https://colordesigner.io/
# But there are many many more!

# Note these are NOT the only way to get a solution
# First let's load up the data set

boxoffice <- 
  read_csv("Box Office.csv")

# 1 What is the average number of positive reviews for the top five movies?
boxoffice %>%
  arrange(Rank) %>%
  head(5) %>%
  summarize(mean_pos = mean(AllPos, na.rm = TRUE)) %>%
  pull()
  
# 2 What are the average number of negative reviews for the bottom five movies?
boxoffice %>%
  arrange(Rank) %>%
  tail(5) %>%
  summarize(mean_pos = mean(AllPos, na.rm = TRUE)) %>%
  pull()

# 3 How were movies released over the years? Provide counts and a visualization.
boxoffice_annualnum <- 
  boxoffice %>%
  group_by(year) %>%
  count(name = "number of movies") %>%
  ungroup(); boxoffice_annualnum 


# 4 Which measure of central tendency is the best to describe the average number of movies over the years? 
# Since the data is skewed, likely the median is the best indicator of the true average
boxoffice_median <- 
boxoffice_annualnum %>%
  summarize(median = median(`number of movies`, na.rm = TRUE)) %>%
  pull(); boxoffice_median

boxoffice_mean <- 
boxoffice_annualnum %>%
  summarize(mean = mean(`number of movies`, na.rm = TRUE)) %>%
  pull(); boxoffice_mean

ggplot(boxoffice_annualnum, 
       aes(year, 
           `number of movies`, 
           fill = `number of movies`)) +
  geom_bar(stat = "identity") + 
  theme_minimal() +
  scale_fill_viridis_c(direction = -1)

# Not shown but given here
ggplot(boxoffice_annualnum, 
         aes(year, 
             `number of movies`, 
             fill = `number of movies`)) +
  geom_bar(stat = "identity") + 
  theme_minimal() +
  scale_fill_viridis_c(direction = -1) +
  geom_hline(yintercept = boxoffice_mean,
               size = 1,
               color = "#9ec8e7",
               show.legend = TRUE) +
  geom_text(aes(1960, boxoffice_mean,
                label = "mean", 
                vjust = -1),
            color = "#9ec8e7",) +
  geom_hline(yintercept = boxoffice_median,
             size = 1,
             color = "#6f9a91",
             show.legend = TRUE) +
  geom_text(aes(1960, boxoffice_median,
                label = "median", 
                vjust = -1),
            color = "#6f9a91")

# 5 Which year has the most number of ranked movies? 
boxoffice %>%
  group_by(year) %>%
  tally(name = "number of movies") %>%
  ungroup() %>%
  filter(`number of movies` == max(`number of movies`))
#OR
boxoffice %>%
  group_by(year) %>%
  summarise(`number of movies` = n()) %>%
  ungroup() %>%
  filter(`number of movies` == max(`number of movies`))
#OR
boxoffice %>%
  group_by(year) %>%
  mutate(`number of movies` = n()) %>%
  ungroup() %>%
  distinct(year, .keep_all=TRUE) %>%
  filter(`number of movies` == max(`number of movies`)) %>%
  select(year, `number of movies`)

# Bonus that you didn't know existed: top ranked movie by year
top_movie_year <- 
  boxoffice %>%
  group_by(year) %>%
  filter(Rank == max(Rank)) %>%
  select(Rank, Movie, year)%>%
  arrange(-year) %>%
  ungroup(); top_movie_year 

# Numerical
ggplot(top_movie_year, 
       aes(year, 
           Rank, 
           fill = Movie)) +
  geom_bar(stat = "identity",
           show.legend = FALSE) + 
  theme_minimal() +
  scale_fill_viridis_d(direction = -1) +
  labs(title = "Top Movies by Year and Rank",
       subtitle = "According to Rotten Tomatoes")
  
# Categorical
ggplot(top_movie_year, 
       aes(year, 
           reorder(Movie, -year), 
           fill = Movie)) +
  geom_bar(stat = "identity",
           show.legend = FALSE) + 
  theme_minimal() +
  scale_fill_viridis_d(direction = -1) +
  labs(title = "Top Movies by Year",
       subtitle = "According to Rotten Tomatoes") +
  coord_cartesian(xlim = c(1900, 2015))

# Load up NFL data
nfl_pol <- read_csv("teampolview.csv")

# View(nfl_pol)

# Distribution of Democrats and Republicans by teams

nfl_percentages <- 
  nfl_pol %>%
  select(Team, `Total Respondents`, `Total Democrats`, Republican, `Other Republican`) %>%
  rowwise(Team) %>%
  mutate(`Total Republicans` = sum(c(Republican,`Other Republican`))) %>%
  select(-c(Republican,`Other Republican`)) %>% 
  mutate(percent_dem = round(`Total Democrats`/`Total Respondents`,2)) %>%
  mutate(percent_rep = round(`Total Republicans`/`Total Respondents`,2))

p1 <- ggplot(nfl_percentages, aes(reorder(Team, percent_dem), 
                            percent_dem,
                            fill = percent_dem)) +
  geom_bar(stat="identity") +
  coord_flip() +
  theme_minimal() 

p2 <- ggplot(nfl_percentages, aes(reorder(Team, percent_rep), 
                            percent_rep,
                            fill = percent_rep)) +
  geom_bar(stat="identity") +
  coord_flip() +
  theme_minimal() 

p1 + p2


nlf_percentages_long <- nfl_percentages %>%
  pivot_longer(c(percent_dem, percent_rep),
               names_to = "type",
               values_to = "political_percentages")


ggplot(nlf_percentages_long, aes(Team, 
                                 political_percentages,
                            fill =  political_percentages)) +
  geom_bar(stat="identity") +
  coord_flip() +
  theme_minimal() +
  facet_wrap(.~type)

