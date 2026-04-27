sstable.formula <- function(formula) {
  if (length(formula) < 3) {
    stop("Missing row-wise variable(s) !!!")
  }

  ## get formula to extract all required variables (formula0)
  formula0 <- if (identical(formula[[3]], 1)) {
    as.formula(paste("~", deparse(formula[[2]])))
  } else {
    as.formula(paste("~", paste(getvar(formula), collapse = "+")))
  }

  ## get index of each element in formula
  xlen <- length(all.vars(formula[[2]]))
  if (xlen == 0) {
    stop("Missing row-wise variable(s) !!!")
  }

  if (length(formula[[3]]) > 1) {
    if (deparse(formula[[3]][[1]]) == "|") {
      ylen <- ifelse(
        identical(formula[[3]][[2]], 1),
        0,
        length(all.vars(formula[[3]][[2]]))
      )
      zlen <- length(all.vars(formula[[3]][[3]]))
    } else {
      ylen <- ifelse(
        identical(formula[[3]], 1),
        0,
        length(all.vars(formula[[3]]))
      )
      zlen <- 0
    }
  } else {
    ylen <- ifelse(
      identical(formula[[3]], 1),
      0,
      length(all.vars(formula[[3]]))
    )
    zlen <- 0
  }

  if (ylen > 1) {
    stop("Only 1 column-wise variable is allowed !!!")
  }
  if (zlen > 1) {
    stop("Only 1 third dimension variable is allowed !!!")
  }

  ## get all formulas required for tabulation
  xs <- getvar(formula[[2]])
  formula1 <- sapply(xs, function(x) {
    update.formula(old = formula, new = paste(x, " ~ ."))
  })

  ## output
  return(list(
    formula0 = formula0,
    index = list(
      x = 1:xlen,
      y = if (ylen == 0) 0 else (xlen + 1),
      z = if (zlen == 0) 0 else (xlen + 2)
    ),
    formula1 = formula1
  ))
}

getvar <- function(formula) {
  if (!is.call(formula)) {
    deparse(formula)
  } else {
    if (
      identical(formula[[1]], quote(`~`)) |
        identical(formula[[1]], quote(`+`)) |
        identical(formula[[1]], quote(`|`))
    ) {
      unlist(lapply(c(formula[[2]], formula[[3]]), getvar))
    } else {
      deparse(formula)
    }
  }
}

#' Obtain label of variable(s) based on metadata information
#'
#' @description A function to obtain label of one vector or each variable in one data frame based on pre-defined metadata information.
#'
#' @param x a vector or data frame to get label.
#' @param meta a data frame contains metadata of the dataset. This data frame should have the following variables: varname (character variable specifies name of each variable), label (character variable specifies label of each variables), type (character variable specifies type of each variable: `numeric`, `factor`, `character`, `datetime`), unit (character variable specifies units of each continuous variable), scale (numeric variable specifies how each variable will be scaled).
#' @param unit a logical value specifies whether unit will be appended in the label of continuous variables.
#' @param fit a logical value specifies whether the label will use presentation as in model fitting.
#'
#' @return vector of character of label
#' @export
getlabel <- function(x, meta = NULL, unit = TRUE, fit = FALSE) {
  if (is.null(dim(x))) {
    getlabel.one(x, meta = meta, unit = unit, fit = fit)
  } else {
    getlabel.data(x, meta = meta, unit = unit, fit = fit)
  }
}

getlabel.default <- function(x, unit = TRUE, fit = FALSE) {
  if (is.null(attr(x, "type"))) {
    attr(x, "type") <- ""
  }
  if (is.null(attr(x, "label"))) {
    attr(x, "label") <- ""
  }

  # to create polished label
  if ((is.factor(x) | attr(x, 'type') == 'factor') | unit == FALSE) {
    # if factor or do not need unit
    as.character(attr(x, 'label'))
  } else {
    # if not factor and need unit
    new_unit <- ifelse(
      fit == FALSE,
      ifelse(is.null(attr(x, 'unit')), '', attr(x, 'unit')),
      paste(
        '+',
        ifelse(is.null(attr(x, 'scale')), 1, attr(x, 'scale')),
        ' ',
        ifelse(is.null(attr(x, 'unit')), '', attr(x, 'unit')),
        sep = ''
      )
    )
    ifelse(
      new_unit == "",
      as.character(attr(x, 'label')),
      as.character(paste(attr(x, 'label'), ' [', new_unit, ']', sep = ''))
    )
  }
}

getlabel.one <- function(x, meta = NULL, unit = TRUE, fit = FALSE) {
  # to create polished label for variable x from meta information

  if (!is.null(meta)) {
    # extract meta info
    .label <- ifelse(
      is.na(meta$label[meta$varname == x]),
      '',
      meta$label[meta$varname == x]
    )
    .unit <- ifelse(
      is.na(meta$unit[meta$varname == x]),
      '',
      meta$unit[meta$varname == x]
    )
    .scale <- ifelse(
      is.na(meta$scale[meta$varname == x]),
      1,
      meta$scale[meta$varname == x]
    )
    .type <- meta$type[meta$varname == x]

    # create label
    if (.type == 'factor' | unit == FALSE) {
      # if factor or do not need unit
      out <- as.character(.label)
    } else {
      # if not factor and need unit
      new_unit <- ifelse(
        fit == FALSE,
        .unit,
        paste('+', .scale, ' ', .unit, sep = '')
      )
      out <- as.character(paste(.label, ' [', new_unit, ']', sep = ''))
    }
  } else {
    # if no meta information
    out <- getlabel.default(x, unit = unit, fit = fit)
  }

  # return
  out
}

getlabel.data <- function(data, meta = NULL, unit = TRUE, fit = FALSE) {
  # to create polished label for variables in data frame data from meta information

  out <- names(data)

  if (!is.null(meta)) {
    namedat <- merge(
      data.frame(varname = out),
      meta,
      by = 'varname',
      all.x = TRUE
    )

    # extract meta info
    namedat <- transform(
      .label = ifelse(is.na(label), varname, label),
      .unit = ifelse(is.na(unit), '', unit),
      .scale = ifelse(is.na(scale), 1, scale)
    )

    # create label
    if (unit == FALSE) {
      out <- as.character(namedat$.label)
    } else {
      if (fit) {
        namedat$.unit <- with(namedat, paste('+', .scale, ' ', .unit, sep = ''))
      }
      out <- with(
        namedat,
        ifelse(
          type == 'factor',
          as.character(.label),
          as.character(paste0(.label, ' [', .unit, ']'))
        )
      )
    }
  } else {
    if (ncol(data) == 1) {
      out <- getlabel.default(data)
    } else {
      out <- sapply(data, getlabel.default)
    }
    if (any(out == "")) {
      tmp <- colnames(data)
      out <- ifelse(out == "", tmp, out)
    }
  }

  # return
  out
}


#' Calculate summary statistics for continuous variable
#'
#' @description A function to calculate summary statistics for continuous variable.
#'
#' @param x a numeric vector to be summarised.
#' @param statistics a character specifies summary statistics for continuous row variables.
#' @param digits a number specifies number of significant digits for numeric statistics.
#' @param n a logical value specifies whether output will contain the number of non-missing values.
#'
#' @return a string displays formatted summary statistics.
#' @export
contSummary <- function(x, statistics = NULL, digits = 1, n = TRUE) {
  if (is.null(statistics)) {
    stop("Please provide a string for 'statistics'")
  }

  # Convert the 'statistics' string to lowercase
  statistics <- tolower(statistics)

  # Define a list of supported statistics and their corresponding functions
  stat_list <- list(
    mean = function(x) round(mean(x, na.rm = TRUE), digits),
    median = function(x) round(median(x, na.rm = TRUE), digits),
    sd = function(x) round(sd(x, na.rm = TRUE), digits),
    q1 = function(x) round(quantile(x, 0.25, na.rm = TRUE), digits),
    q3 = function(x) round(quantile(x, 0.75, na.rm = TRUE), digits),
    min = function(x) round(min(x, na.rm = TRUE), digits),
    max = function(x) round(max(x, na.rm = TRUE), digits)
  )

  # Replace statistical names with their calculated values
  for (stat_name in names(stat_list)) {
    stat_value <- stat_list[[stat_name]](x)
    stat_value <- format(stat_value, nsmall = digits)
    statistics <- gsub(stat_name, stat_value, statistics)
  }

  # Include the count if requested
  if (n) {
    statistics <- paste0(statistics)
  }

  return(statistics)
}
