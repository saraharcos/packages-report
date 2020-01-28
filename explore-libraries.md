explore-libraries.R
================
saraharcos
2020-01-27

Which libraries does R search for
    packages?

``` r
.libPaths()
```

    ## [1] "/Library/Frameworks/R.framework/Versions/3.5/Resources/library"

``` r
.Library
```

    ## [1] "/Library/Frameworks/R.framework/Resources/library"

Installed
    packages

``` r
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
## use installed.packages() to get all installed packages
pg <- as_tibble(installed.packages())

## how many packages?
n_distinct(pg$Package)
```

    ## [1] 294

Exploring the packages

``` r
## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
##   * what proportion need compilation?
##   * how break down re: version of R they were built on
print(paste("Number of LibPaths: ", n_distinct(pg$LibPath)))
```

    ## [1] "Number of LibPaths:  1"

``` r
pg %>% count(Priority)
```

    ## # A tibble: 3 x 2
    ##   Priority        n
    ##   <chr>       <int>
    ## 1 base           14
    ## 2 recommended    15
    ## 3 <NA>          265

``` r
needscomp <- pg %>% 
  count(NeedsCompilation) %>% 
  mutate(prop = n / sum(n)) %>%
  filter(NeedsCompilation == "yes") %>%
  pull(prop)

print(paste("Proportion of pckgs that need compilation: ", round(needscomp, 3)))
```

    ## [1] "Proportion of pckgs that need compilation:  0.466"

``` r
ggplot(pg, aes(x = Built)) +
  geom_bar(fill = "steelblue") +
  theme_minimal()
```

![](explore-libraries_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

Reflections

``` r
## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?
pg %>%
  count(Priority)
```

    ## # A tibble: 3 x 2
    ##   Priority        n
    ##   <chr>       <int>
    ## 1 base           14
    ## 2 recommended    15
    ## 3 <NA>          265

``` r
ggplot(pg, aes(x = LibPath, fill = Priority)) +
  geom_bar()
```

![](explore-libraries_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
#The result of .libPaths() is ____ from the result of .Library
```

Going further

``` r
## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!

#Not every package is base or recommended, the others are labelled as "NA"

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
    ##  farver        2.0.3   2020-01-16 [1] CRAN (R 3.5.3)
    ##  forcats     * 0.4.0   2019-02-17 [1] CRAN (R 3.5.2)
    ##  fs            1.3.1   2019-05-06 [1] CRAN (R 3.5.2)
    ##  generics      0.0.2   2018-11-29 [1] CRAN (R 3.5.0)
    ##  ggplot2     * 3.2.1   2019-08-10 [1] CRAN (R 3.5.2)
    ##  glue          1.3.1   2019-03-12 [1] CRAN (R 3.5.2)
    ##  gtable        0.3.0   2019-03-25 [1] CRAN (R 3.5.2)
    ##  haven         2.2.0   2019-11-08 [1] CRAN (R 3.5.2)
    ##  highr         0.8     2019-03-20 [1] CRAN (R 3.5.2)
    ##  hms           0.5.3   2020-01-08 [1] CRAN (R 3.5.2)
    ##  htmltools     0.4.0   2019-10-04 [1] CRAN (R 3.5.2)
    ##  httr          1.4.1   2019-08-05 [1] CRAN (R 3.5.2)
    ##  jsonlite      1.6     2018-12-07 [1] CRAN (R 3.5.0)
    ##  knitr         1.27    2020-01-16 [1] CRAN (R 3.5.3)
    ##  labeling      0.3     2014-08-23 [1] CRAN (R 3.5.0)
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
    ##  utf8          1.1.4   2018-05-24 [1] CRAN (R 3.5.0)
    ##  vctrs         0.2.1   2019-12-17 [1] CRAN (R 3.5.2)
    ##  withr         2.1.2   2018-03-15 [1] CRAN (R 3.5.0)
    ##  xfun          0.12    2020-01-13 [1] CRAN (R 3.5.3)
    ##  xml2          1.2.2   2019-08-09 [1] CRAN (R 3.5.2)
    ##  yaml          2.2.0   2018-07-25 [1] CRAN (R 3.5.0)
    ##  zeallot       0.1.0   2018-01-28 [1] CRAN (R 3.5.0)
    ## 
    ## [1] /Library/Frameworks/R.framework/Versions/3.5/Resources/library
