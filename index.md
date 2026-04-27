# oucru

Collection of helper and miscellaneous functions used for and by the
Oxford University Clinical Research Unit (OUCRU), Vietnam

## Installation

You can install the development version of oucru from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("OUCRU-Modelling/oucru")
```

## Example

### OUCRU colors and palette

Basic example for using OUCRU color palette for `ggplot2`

``` r
library(ggplot2)
library(oucru)

# use OUCRU palette for ggplot2 scales
ggplot(mpg, aes(hwy, class, fill = drv)) +
  geom_violin(show.legend = FALSE) +
  scale_fill_oucru_d(palette = "main")
```
