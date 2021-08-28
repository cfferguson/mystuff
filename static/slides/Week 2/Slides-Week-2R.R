
## install.packages("gapminder")



library(gapminder)



head(gapminder$lifeExp)



summary(gapminder$lifeExp)



hist(gapminder$lifeExp)



class(gapminder$continent)



summary(gapminder$continent)



levels(gapminder$continent)



nlevels(gapminder$continent)



table(gapminder$continent)



barplot(table(gapminder$continent))

