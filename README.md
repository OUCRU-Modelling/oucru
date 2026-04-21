
# oucru

<!-- badges: start -->
[![R-CMD-check](https://github.com/OUCRU-Modelling/oucru/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/OUCRU-Modelling/oucru/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Collection of helper and miscellaneous functions used for and by the Oxford University Clinical Research Unit (OUCRU), Vietnam

## Installation

You can install the development version of oucru from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("OUCRU-Modelling/oucru")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(oucru)

# use OUCRU palette for ggplot2 scales
ggplot(mpg, aes(hwy, class, fill = drv)) +
  geom_violin(show.legend = FALSE) +
  scale_fill_oucru_d(palette = "main")
```

