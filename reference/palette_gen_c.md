# Palette generator for continuous scale (used by `ggplot2`)

Palette generator for continuous scale (used by `ggplot2`)

## Usage

``` r
palette_gen_c(palette = "main", direction = 1, ...)
```

## Arguments

- palette:

  OUCRU palette name

- direction:

  Palette direction, 0 or positive number means forward, negative means
  backward

- ...:

  Passed to
  [`grDevices::colorRampPalette()`](https://rdrr.io/r/grDevices/colorRamp.html)
