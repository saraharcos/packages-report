#' Which libraries does R search for packages?
.libPaths()
.Library

#' Installed packages
library(tidyverse)
## use installed.packages() to get all installed packages
pg <- as_tibble(installed.packages())

## how many packages?
n_distinct(pg$Package)

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
##   * what proportion need compilation?
##   * how break down re: version of R they were built on
print(paste("Number of LibPaths: ", n_distinct(pg$LibPath)))
pg %>% count(Priority)

needscomp <- pg %>% 
  count(NeedsCompilation) %>% 
  mutate(prop = n / sum(n)) %>%
  filter(NeedsCompilation == "yes") %>%
  pull(prop)

print(paste("Proportion of pckgs that need compilation: ", round(needscomp, 3)))

ggplot(pg, aes(x = Built)) +
  geom_bar(fill = "steelblue") +
  theme_minimal()

#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?
pg %>%
  count(Priority)

ggplot(pg, aes(x = LibPath, fill = Priority)) +
  geom_bar()

#The result of .libPaths() is ____ from the result of .Library

#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!

#Not every package is base or recommended, the others are labelled as "NA"





