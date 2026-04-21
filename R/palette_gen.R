#' Palette generator for discrete scale (used by `ggplot2`)
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
palette_gen_d <- function(palette = "main", direction = 1) {
  function(n) {
    if (n > length(oucru_palette(palette))) {
      stop("Not enough colors in this palette!")
    } else {
      all_colors <- oucru_palette(palette)
      all_colors <- unname(unlist(all_colors))
      all_colors <- if (direction >= 0) all_colors else rev(all_colors)
      color_list <- all_colors[1:n]
    }
  }
}

#' Palette generator for continuous scale (used by `ggplot2`)
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
#' @param ... Passed to `grDevices::colorRampPalette()`
palette_gen_c <- function(palette = "main", direction = 1, ...) {
  pal <- oucru_palette(palette)
  pal <- if (direction >= 0) pal else rev(pal)

  colorRampPalette(pal, ...)
}
