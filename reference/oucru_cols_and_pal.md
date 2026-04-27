# Functions and constants defining OUCRU colors and palettes based on the brand guideline

Functions and constants defining OUCRU colors and palettes based on the
brand guideline

## Usage

``` r
OUCRU_COLS

oucru_color(...)

OUCRU_PALS

oucru_palette(palette = "main")

oucru_list_pals()
```

## Format

An object of class `character` of length 18.

An object of class `list` of length 7.

## Arguments

- ...:

  Color names as strings

- palette:

  Palette name, check available palettes with `oucru_list_pals()`

## Value

Named list of colors, or full color list if `...` is NULL

OUCRU color palette

## Examples

``` r
# example code
oucru::oucru_color("blue", "orange")
#>      blue    orange 
#> "#002147" "#e08200" 

# example code
oucru::oucru_palette("main")
#>     blue1    orange   yellow1   yellow2   yellow3 
#> "#002147" "#e08200" "#f5cf47" "#ffe3c4" "#fff7f0" 
```
