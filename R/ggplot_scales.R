#' Internal constructor for discrete or continuous ggplot scales
#' @param aes The ggplot aesthetic mapping, e.g. "fill" or "color"
#' @param type Aesthetic scale type, either "d" (discrete) or "c" (continuous)
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
#' @param ... Passed to `ggplot2::discrete_scale()` or `ggplot2::continuous_scale()`
.scale_oucru <- function(
  aes,
  type = c("d", "c"),
  palette = "main",
  direction = 1,
  ...
) {
  type <- match.arg(type)
  switch(
    type,
    d = discrete_scale(
      aesthetics = aes,
      palette = palette_gen_d(palette, direction),
      ...
    ),
    c = continuous_scale(
      aesthetics = aes,
      palette = palette_gen_c(palette, direction),
      ...
    )
  )
}

#' OUCRU colors for `ggplot2` scales
#' @param palette OUCRU palette name
#' @param direction Palette direction, 0 or positive number means forward, negative means backward
#' @param ... Passed to `ggplot2::continuous_scale()`
#' @export
#' @name ggplot_scales
scale_fill_oucru_c <- function(palette = "main", direction = 1, ...) {
  .scale_oucru(
    aes = "fill",
    type = "c",
    palette = palette,
    direction = direction,
    ...
  )
}


#' @rdname ggplot_scales
#' @export
scale_color_oucru_c <- function(palette = "main", direction = 1, ...) {
  .scale_oucru(
    aes = "color",
    type = "c",
    palette = palette,
    direction = direction,
    ...
  )
}


#' @rdname ggplot_scales
#' @export
scale_colour_oucru_c <- function(palette = "main", direction = 1, ...) {
  .scale_oucru(
    aes = "colour",
    type = "c",
    palette = palette,
    direction = direction,
    ...
  )
}

#' @rdname ggplot_scales
#' @export
scale_fill_oucru_d <- function(palette = "main", direction = 1, ...) {
  .scale_oucru(
    aes = "fill",
    type = "d",
    palette = palette,
    direction = direction,
    ...
  )
}


#' @rdname ggplot_scales
#' @export
scale_color_oucru_d <- function(palette = "main", direction = 1, ...) {
  .scale_oucru(
    aes = "color",
    type = "d",
    palette = palette,
    direction = direction,
    ...
  )
}

#' @rdname ggplot_scales
#' @export
scale_colour_oucru_d <- function(palette = "main", direction = 1, ...) {
  .scale_oucru(
    aes = "colour",
    type = "d",
    palette = palette,
    direction = direction,
    ...
  )
}
