# Functions to fetch OUCRU colors and palettes based on the brand guideline

Functions to fetch OUCRU colors and palettes based on the brand
guideline

## Usage

``` r
oucru_color(...)

oucru_palette(palette = "main")

oucru_list_pals()
```

## Arguments

- ...:

  Color names as strings

- palette:

  Palette name, check available palettes with `oucru_list_pals()`

## Examples

``` r
oucru::oucru_color("blue", "orange")
#>      blue    orange 
#> "#002147" "#e08200" 

oucru::oucru_palette("main")
#>     blue1    orange   yellow1   yellow2   yellow3 
#> "#002147" "#e08200" "#f5cf47" "#ffe3c4" "#fff7f0" 

oucru::oucru_list_pals()
#> $group1
#>     blue1     blue2     blue3     blue3 
#> "#002147" "#45697d" "#87bfbd" "#87bfbd" 
#> 
#> $group2
#>     blue1     blue2     blue3     blue3 
#> "#002147" "#45697d" "#87bfbd" "#87bfbd" 
#> 
#> $group3
#>     blue1     white 
#> "#002147" "#ffffff" 
#> 
#> $group4
#>     blue1    orange   yellow1   yellow2   yellow3 
#> "#002147" "#e08200" "#f5cf47" "#ffe3c4" "#fff7f0" 
#> 
#> $main
#>     blue1    orange   yellow1   yellow2   yellow3 
#> "#002147" "#e08200" "#f5cf47" "#ffe3c4" "#fff7f0" 
#> 
#> $group5
#>     blue1    green1    green2    green3 
#> "#002147" "#004047" "#b5c48a" "#ebf2c2" 
#> 
#> $alert
#>      red2      red1     blue1 
#> "#730d0d" "#bf1c1c" "#002147" 
#> 
#> ℹ Check the official brand guideline for more information
```
