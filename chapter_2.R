library(tidyverse)


# EXERCISES 2.2.1 ---------------------------------------------------------

## Q1 List five functions that you could use to get more information 
# about the mpg dataset
summary(mpg)
View(mpg)
str(mpg)
glimpse(mpg)
class(mpg)

## Q2 How can you find out what other datasets are included with ggplot2?
data(package = 'ggplot2')

## Q3 Apart from the US, most countries use fuel consumption 
# (fuel consumed over fixed distance) rather than fuel economy 
# (distance travelled with fixed amount of fuel). How could 
# you convert cty and hwy into the European standard of l/100km? 
# Note 1: We convert to the EU standard: liters/100km.
# Note 2: The EPA report 42 gallons to a barrel 
# (a standard in the worldwide oil industry),
# but metric countries measure volume at a
# different temperature to the USA, so the exact
# conversion from barrel to liters is quite involved.
# The approximation of 159 liters/barrel is close.
lpg <- 159/42 # liters per gallon
mpk <- 5/8    # miles per kilometers
mpg_to_lpk <- function(mpg) {mpk*lpg/mpg}
mpg <- mpg %>% mutate(cty_eu = mpg_to_lpk(cty)*100, 
                      hwy_eu = mpg_to_lpk(hwy)*100)

## Q4.1 Which manufacturer has the most distinct models?
mpg %>% 
  group_by(manufacturer) %>%
  summarise(n_models = n_distinct(model)) %>% 
  arrange(desc(n_models))

## Q4.2 Which model has the most variations?
mpg %>% 
  group_by(model) %>% 
  summarise(n_variations = n()) %>% 
  arrange(desc(n_variations))

## Q4.3 Which model has the most variations (ignoring drive train spec)?
mpg %>% 
  group_by(model_class = sub(" .*", "", mpg$model)) %>% 
  summarise(n_variations = n()) %>% 
  arrange(desc(n_variations))



# EXERCISES 2.3.1 ---------------------------------------------------------


