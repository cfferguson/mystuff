library(tidyverse)
library(gapminder)
library(countrycode)
library(hrbrthemes)

gdple <- 
  gapminder %>% 
  mutate(country = reorder(country, -1 * pop)) %>% 
  arrange(year, country) %>% 
  mutate(region = countrycode(sourcevar = country, 
                              origin = "country.name",
                              destination = "region23")) %>%
  mutate(decade = case_when(
    year >= 1950 & year < 1960 ~ "1950s",
    year >= 1960 & year < 1970 ~ "1960s",
    year >= 1970 & year < 1980 ~ "1970s",
    year >= 1980 & year < 1990 ~ "1980s",
    year >= 1990 & year < 2000 ~ "1990s",
    year >= 2000 & year < 2010 ~ "2000s"
    )
  ) %>%
 filter(str_detect(region, 'America')) %>% 
 mutate(continent = str_replace_all(continent, "Americas", "North, Central, & South America")) %>%
 droplevels()

# unique(gdple$region) # Take a look at the unique regions

gdple %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp, 
             fill = lifeExp)) +
  geom_point(aes(size = pop), 
             pch = 21, 
             stroke = 0.5,
             color = "#b9bdc9",
             show.legend = FALSE) +
  scale_fill_gradient(low = "#e86af0", 
                      high = "#7bc043") +
  facet_grid(continent ~ decade) +
  scale_x_log10(limits = c(1500, 47500)) +
  scale_size_continuous(range = c(1,7)) +
  theme_ft_rc(axis_title_size = 16,
              axis_title_face = "bold",
              strip_text_size = 13) +
  theme(plot.title = element_text(color = "#bcd3d4",
                                  size = 20),
        plot.caption = element_text(face = "italic"),
        axis.title.x = element_text(margin = margin(t = 15),
                                    color = "#c5ced9"),
        axis.title.y = element_text(margin = margin(r = 15),
                                    color = "#c5ced9"),
        strip.text.y = element_text(size = 15,
                                    face = "bold",
                                    margin = margin(l = 15),
                                    hjust = 1,
                                    color = "#b8e2f2")) +
  xlab("GDP per Capita") +
  ylab("Life Expectancy") +
  labs(title = "Comparison of GDP vs. Life Expectancy in the Americas",
       caption = "GDP per capita values have been scaled so differences between decades are easier to see")

