# Install packages ----
install.packages("esquisse", dependencies = TRUE)
install.packages("palmerpenguins", dependencies = TRUE)

# Run this to explore ggplot through a drag and drop environment ----
esquisse::esquisser(palmerpenguins::penguins)