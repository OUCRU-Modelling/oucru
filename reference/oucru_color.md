# Fetch OUCRU color by names (if it is defined)

Fetch OUCRU color by names (if it is defined)

## Usage

``` r
oucru_color(...)
```

## Arguments

- ...:

  Color names as strings

## Value

Named list of colors, or full color list if `...` is NULL

## Examples

``` r
# example code
oucru::oucru_color("blue", "orange")
#>      blue    orange 
#> "#002147" "#e08200" 
```
