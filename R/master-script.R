library(tidyverse)
library(here)

#run 01_write-installed-packages.R
source(here("R", "01_write-installed-packages.R"))

#run 02_wrangle-packages.R
source(here("R", "02_wrangle-packages.R"))

#run 03_barchart-packages-built.R
source(here("R", "03_barchart-packages-built.R"))

#clean environment
source(here("R", "makeclean.R"))
