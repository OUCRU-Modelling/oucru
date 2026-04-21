#' `ggplot2` fill colors for continuous scale
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
#' @export
scale_fill_oucru_c <- function(
  palette = "main",
  direction = 1,
  ...
) {
  continuous_scale(
    aesthetics = "fill",
    palette = palette_gen(palette, direction),
    ...
  )
}

#' `ggplot2` geom colors for continuous scale
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
#' @export
scale_color_oucru_c <- function(
  palette = "main",
  direction = 1,
  ...
) {
  continuous_scale(
    aesthetics = "color",
    palette = palette_gen(palette, direction),
    ...
  )
}

#' `ggplot2` geom colors for continuous scale
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
#' @export
scale_colour_oucru_c <- function(
  palette = "main",
  direction = 1,
  ...
) {
  continuous_scale(
    aesthetics = "colour",
    palette = palette_gen(palette, direction),
    ...
  )
}
