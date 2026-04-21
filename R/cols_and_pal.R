#' Define OUCRU colors based on the brand guideline
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


#' Fetch OUCRU color by names (if it is defined)
#'
#' @param ... Color names as strings
#' @returns Named list of colors, or full color list if `...` is NULL
#' @examples
#' # example code
#' oucru_color("blue", "orange")
oucru_color <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(OUCRU_COLS)
  }

  OUCRU_COLS[cols]
}


#' Define OUCRU palettes based on the brand guideline
OUCRU_PALS <- list(
  `group1` = oucru_color("blue1", "blue2", "blue3", "blue3"),
  `group2` = oucru_color("blue1", "blue2", "blue3", "blue3"),
  `group3` = oucru_color("blue1", "white"),
  `group4` = oucru_color("blue1", "orange", "yellow1", "yellow2", "yellow3"),
  `main` = oucru_color("blue1", "orange", "yellow1", "yellow2", "yellow3"),
  `group5` = oucru_color("blue1", "green1", "green2", "green3"),
  `alert` = oucru_color("red2", "red1", "blue1")
)

#' Fetch OUCRU color palette by name (if it is defined)
#'
#' @param palette Palette name
#' @param ... unused
#' @returns OUCRU color palette
#' @examples
#' # example code
#' oucru_palette("main")
oucru_palette <- function(palette = "main", ...) {
  OUCRU_PALS[[palette]]
}

#' List OUCRU palettes
#' @export
oucru_list_pals <- function() {
  print(OUCRU_PALS)
  cli_inform(c("i" = "Check the official brand guideline for more information"))
}
