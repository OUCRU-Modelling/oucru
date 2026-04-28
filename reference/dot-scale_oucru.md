# Internal constructor for discrete or continuous ggplot scales

Internal constructor for discrete or continuous ggplot scales

## Usage

``` r
.scale_oucru(aes, type = c("d", "c"), palette = "main", direction = 1, ...)
```

## Arguments

- aes:

  The ggplot aesthetic mapping, e.g. "fill" or "color"

- type:

  Aesthetic scale type, either "d" (discrete) or "c" (continuous)

- palette:

  OUCRU palette name

- direction:

  Palette direction, 0 or positive number means forward, negative means
  backward

- ...:

  Passed to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  or
  [`ggplot2::continuous_scale()`](https://ggplot2.tidyverse.org/reference/continuous_scale.html)

## Value

[`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
or
[`ggplot2::continuous_scale()`](https://ggplot2.tidyverse.org/reference/continuous_scale.html)
