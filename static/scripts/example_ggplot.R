library(tidyverse) # Load the tidyverse package

zscore <- tibble(horizontal = c(-3.5, 3.5)) # Define the range of the z-score in a tibble

ggplot(data = zscore, # Tell ggplot to use the zscore data set
       aes(horizontal)) + # Aesthetics are mapped only to the values in the first column
  stat_function( # Use points to define a distribution
    geom = "area", # Tell stat_function to plot looking at the area under the curve
    fill = "#428bca", # Fill the area with the a light blue color 
    fun = dnorm, # Use the normal distribution density function  
    n = 101, # Use a sample of 101 data points
    args = list(mean = 0, # Tell the function to use a mean value of 0
                sd = 1) # Tell the function to use a standard deviation of 1
    ) + 
  theme_minimal() + # Remove most aesthetics using the minimal theme
  theme(axis.text.y = element_blank(), # Remove the y-axis values
        axis.title = element_blank(), # Remove both the x- and y-axis labels
        panel.grid.major.y = element_blank(), # Remove the primary horizontal grid lines
        panel.grid.minor.y = element_blank()) + # Remove the secondary horizontal grid lines
  xlim(c(-4, 4)) + # Expand the horizontal axis to -4 to 4
  scale_x_continuous(breaks = c(-3:3)) # Show only the labels from -3 to 3 on the x-axis
  

