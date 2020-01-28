02\_wrangle-packages.R
================
saraharcos
2020-01-27

``` r
## remember to restart R here!
library(tidyverse)
```

    ## ── Attaching packages ───────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
    ## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
    ## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.4.0

    ## ── Conflicts ──────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(here)
```

    ## here() starts at /Users/saraharcos/Desktop/packages-report

``` r
## create a data frame by reading from data/installed-packages.csv
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path
ipt <- readr::read_csv(here("data", "installed-packages.csv"))
```

    ## Parsed with column specification:
    ## cols(
    ##   Package = col_character(),
    ##   LibPath = col_character(),
    ##   Version = col_character(),
    ##   Priority = col_character(),
    ##   Built = col_character()
    ## )

``` r
## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
apt <- ipt %>%
  dplyr::filter(is.na(Priority)) %>%
  dplyr::select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path
readr::write_csv(apt, here("data", "add-on-packages.csv"))

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path
write_csv(apt_freqtable, here("data", "add-on-packages-freqtable.csv"))

## YES overwrite the files that are there now
## they are old output from me (Jenny)
## they are just examples

devtools::session_info()
```

    ## ─ Session info ───────────────────────────────────────────────────────────────
    ##  setting  value                       
    ##  version  R version 3.5.3 (2019-03-11)
    ##  os       macOS Mojave 10.14.5        
    ##  system   x86_64, darwin15.6.0        
    ##  ui       X11                         
    ##  language (EN)                        
    ##  collate  en_US.UTF-8                 
    ##  ctype    en_US.UTF-8                 
    ##  tz       America/Los_Angeles         
    ##  date     2020-01-27                  
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package     * version date       lib source        
    ##  assertthat    0.2.1   2019-03-21 [1] CRAN (R 3.5.2)
    ##  backports     1.1.5   2019-10-02 [1] CRAN (R 3.5.2)
    ##  broom         0.5.3   2019-12-14 [1] CRAN (R 3.5.2)
    ##  callr         3.4.0   2019-12-09 [1] CRAN (R 3.5.2)
    ##  cellranger    1.1.0   2016-07-27 [1] CRAN (R 3.5.0)
    ##  cli           2.0.1   2020-01-08 [1] CRAN (R 3.5.2)
    ##  colorspace    1.4-1   2019-03-18 [1] CRAN (R 3.5.2)
    ##  crayon        1.3.4   2017-09-16 [1] CRAN (R 3.5.0)
    ##  DBI           1.1.0   2019-12-15 [1] CRAN (R 3.5.2)
    ##  dbplyr        1.4.2   2019-06-17 [1] CRAN (R 3.5.3)
    ##  desc          1.2.0   2018-05-01 [1] CRAN (R 3.5.0)
    ##  devtools      2.2.1   2019-09-24 [1] CRAN (R 3.5.2)
    ##  digest        0.6.23  2019-11-23 [1] CRAN (R 3.5.2)
    ##  dplyr       * 0.8.3   2019-07-04 [1] CRAN (R 3.5.2)
    ##  ellipsis      0.3.0   2019-09-20 [1] CRAN (R 3.5.2)
    ##  evaluate      0.14    2019-05-28 [1] CRAN (R 3.5.2)
    ##  fansi         0.4.1   2020-01-08 [1] CRAN (R 3.5.2)
    ##  forcats     * 0.4.0   2019-02-17 [1] CRAN (R 3.5.2)
    ##  fs            1.3.1   2019-05-06 [1] CRAN (R 3.5.2)
    ##  generics      0.0.2   2018-11-29 [1] CRAN (R 3.5.0)
    ##  ggplot2     * 3.2.1   2019-08-10 [1] CRAN (R 3.5.2)
    ##  glue          1.3.1   2019-03-12 [1] CRAN (R 3.5.2)
    ##  gtable        0.3.0   2019-03-25 [1] CRAN (R 3.5.2)
    ##  haven         2.2.0   2019-11-08 [1] CRAN (R 3.5.2)
    ##  here        * 0.1     2017-05-28 [1] CRAN (R 3.5.0)
    ##  highr         0.8     2019-03-20 [1] CRAN (R 3.5.2)
    ##  hms           0.5.3   2020-01-08 [1] CRAN (R 3.5.2)
    ##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 3.5.2)
    ##  httr          1.4.1   2019-08-05 [1] CRAN (R 3.5.2)
    ##  jsonlite      1.6     2018-12-07 [1] CRAN (R 3.5.0)
    ##  knitr         1.27    2020-01-16 [1] CRAN (R 3.5.3)
    ##  lattice       0.20-38 2018-11-04 [1] CRAN (R 3.5.3)
    ##  lazyeval      0.2.2   2019-03-15 [1] CRAN (R 3.5.2)
    ##  lifecycle     0.1.0   2019-08-01 [1] CRAN (R 3.5.2)
    ##  lubridate     1.7.4   2018-04-11 [1] CRAN (R 3.5.0)
    ##  magrittr      1.5     2014-11-22 [1] CRAN (R 3.5.0)
    ##  memoise       1.1.0   2017-04-21 [1] CRAN (R 3.5.0)
    ##  modelr        0.1.5   2019-08-08 [1] CRAN (R 3.5.2)
    ##  munsell       0.5.0   2018-06-12 [1] CRAN (R 3.5.0)
    ##  nlme          3.1-143 2019-12-10 [1] CRAN (R 3.5.2)
    ##  pillar        1.4.3   2019-12-20 [1] CRAN (R 3.5.2)
    ##  pkgbuild      1.0.6   2019-10-09 [1] CRAN (R 3.5.2)
    ##  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 3.5.2)
    ##  pkgload       1.0.2   2018-10-29 [1] CRAN (R 3.5.0)
    ##  prettyunits   1.1.0   2020-01-09 [1] CRAN (R 3.5.2)
    ##  processx      3.4.1   2019-07-18 [1] CRAN (R 3.5.2)
    ##  ps            1.3.0   2018-12-21 [1] CRAN (R 3.5.0)
    ##  purrr       * 0.3.3   2019-10-18 [1] CRAN (R 3.5.2)
    ##  R6            2.4.1   2019-11-12 [1] CRAN (R 3.5.2)
    ##  Rcpp          1.0.3   2019-11-08 [1] CRAN (R 3.5.2)
    ##  readr       * 1.3.1   2018-12-21 [1] CRAN (R 3.5.0)
    ##  readxl        1.3.1   2019-03-13 [1] CRAN (R 3.5.2)
    ##  remotes       2.1.0   2019-06-24 [1] CRAN (R 3.5.2)
    ##  reprex        0.3.0   2019-05-16 [1] CRAN (R 3.5.2)
    ##  rlang         0.4.2   2019-11-23 [1] CRAN (R 3.5.2)
    ##  rmarkdown     2.0     2019-12-12 [1] CRAN (R 3.5.2)
    ##  rprojroot     1.3-2   2018-01-03 [1] CRAN (R 3.5.0)
    ##  rstudioapi    0.10    2019-03-19 [1] CRAN (R 3.5.2)
    ##  rvest         0.3.5   2019-11-08 [1] CRAN (R 3.5.2)
    ##  scales        1.1.0   2019-11-18 [1] CRAN (R 3.5.2)
    ##  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 3.5.0)
    ##  stringi       1.4.5   2020-01-11 [1] CRAN (R 3.5.3)
    ##  stringr     * 1.4.0   2019-02-10 [1] CRAN (R 3.5.2)
    ##  testthat      2.3.1   2019-12-01 [1] CRAN (R 3.5.2)
    ##  tibble      * 2.1.3   2019-06-06 [1] CRAN (R 3.5.2)
    ##  tidyr       * 1.0.0   2019-09-11 [1] CRAN (R 3.5.2)
    ##  tidyselect    0.2.5   2018-10-11 [1] CRAN (R 3.5.0)
    ##  tidyverse   * 1.3.0   2019-11-21 [1] CRAN (R 3.5.2)
    ##  usethis       1.5.1   2019-07-04 [1] CRAN (R 3.5.2)
    ##  vctrs         0.2.1   2019-12-17 [1] CRAN (R 3.5.2)
    ##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.5.0)
    ##  xfun          0.12    2020-01-13 [1] CRAN (R 3.5.3)
    ##  xml2          1.2.2   2019-08-09 [1] CRAN (R 3.5.2)
    ##  yaml          2.2.0   2018-07-25 [1] CRAN (R 3.5.0)
    ##  zeallot       0.1.0   2018-01-28 [1] CRAN (R 3.5.0)
    ## 
    ## [1] /Library/Frameworks/R.framework/Versions/3.5/Resources/library
