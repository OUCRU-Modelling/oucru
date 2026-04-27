._lv_rev_ <- function(x) {
  new_x <- factor(x, levels = rev(levels(x)), exclude = NULL)
  attributes(new_x) <- utils::modifyList(attributes(x), attributes(new_x))
  new_x
}
