#' Functions and constants defining OUCRU colors and palettes based on the
#' brand guideline
#' @export
#' @name oucru_cols_and_pal
OUCRU_COLS <- c(
  `blue` = "#002147",
  `blue1` = "#002147",
  `blue2` = "#45697d",
  `blue3` = "#87bfbd",
  `blue4` = "#c2f2f0",
  `green1` = "#004047",
  `green2` = "#b5c48a",
  `green3` = "#ebf2c2",
  `orange` = "#e08200",
  `yellow1` = "#f5cf47",
  `yellow2` = "#ffe3c4",
  `yellow3` = "#fff7f0",
  `red1` = "#bf1c1c",
  `red2` = "#730d0d",
  `gray` = "#d9d9d9",
  `grey` = "#d9d9d9",
  `black` = "#141414",
  `white` = "#ffffff"
)


#' @param ... Color names as strings
#' @returns Named list of colors, or full color list if `...` is NULL
#' @export
#' @examples
#' # example code
#' oucru::oucru_color("blue", "orange")
#'
#' @rdname oucru_cols_and_pal
oucru_color <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(OUCRU_COLS)
  }

  OUCRU_COLS[cols]
}


#' @export
#' @rdname oucru_cols_and_pal
OUCRU_PALS <- list(
  `group1` = oucru_color("blue1", "blue2", "blue3", "blue3"),
  `group2` = oucru_color("blue1", "blue2", "blue3", "blue3"),
  `group3` = oucru_color("blue1", "white"),
  `group4` = oucru_color("blue1", "orange", "yellow1", "yellow2", "yellow3"),
  `main` = oucru_color("blue1", "orange", "yellow1", "yellow2", "yellow3"),
  `group5` = oucru_color("blue1", "green1", "green2", "green3"),
  `alert` = oucru_color("red2", "red1", "blue1")
)

#' @param palette Palette name, check available palettes with `oucru_list_pals()`
#' @returns OUCRU color palette
#' @export
#' @examples
#' # example code
#' oucru::oucru_palette("main")
#'
#' @rdname oucru_cols_and_pal
oucru_palette <- function(palette = "main") {
  OUCRU_PALS[[palette]]
}

#' @export
#' @rdname oucru_cols_and_pal
oucru_list_pals <- function() {
  print(OUCRU_PALS)
  cli_inform(c("i" = "Check the official brand guideline for more information"))
}

#' Palette generator for use by `ggplot2`
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
#' @param ... Passed to `grDevices::colorRampPalette()`
#' @export
#' @name oucru_pal_gen
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

#' @export
#' @rdname oucru_pal_gen
palette_gen_c <- function(palette = "main", direction = 1, ...) {
  pal <- oucru_palette(palette)
  pal <- if (direction >= 0) pal else rev(pal)

  colorRampPalette(pal, ...)
}
