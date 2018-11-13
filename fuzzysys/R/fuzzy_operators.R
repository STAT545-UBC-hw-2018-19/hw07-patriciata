#' @title Fuzzy Logic Operators
#' @description Alternative (non-dynamic) wrapper functions for \code{\link[sets:fuzzy]{sets::fuzzy_logic()}}. Here, operators are explicitly specified-- unlike the original wrapper functions in the \code{sets} package, their behaviour can be controlled with the an input parameter (\code{type}).
#' @param x Numeric vector
#' @param y Numeric vector
#' @param type Character string specifying which fuzzy logic family to refer to. (Refer to sets documentation (\code{\link[sets]{fuzzy}}) for more details.) Defaults to "Zadeh" type fuzzy logic.
#' @return Returns a numeric vector, whose values depend on the fuzzy operator called (see Details for more information)
#' @details
#' \describe{
#' \item{.T : conjunction operator}{
#' This function calculates the "t-norm", i.e. the equivalent of the "AND" operator in fuzzy logic.
#' It outputs the result of \code{sets::fuzzy_logic()$T}, but replaces values with 0 in the cases where values in either \code{x} or \code{y} is \code{NA} and the other is 0 (i.e., ignore the \code{NA} value).}
#' \item{.S : disjunction operator}{
#' This function calculates the "t-conorm", i.e. the equivalent of the "OR" operator in fuzzy logic.
#' It outputs the result of \code{sets::fuzzy_logic()$S}, but replaces values with 1 in the cases where values in either \code{x} or \code{y} is \code{NA} and the other is 1 (i.e., ignore the \code{NA} value).}
#' \item{.N : negation operator}{
#' This function calculates the equivalent of the "NOT" operator in fuzzy logic.
#' Outputs \code{1-x} for most fuzzy logic families, consistent with \code{sets::fuzzy_logic()$N}.}}
#'
#' @section References:
#' Meyer D and Hornik K (2009). “Generalized and Customizable Sets in R.” Journal of Statistical Software, 31(2), pp. 1–27. doi: 10.18637/jss.v031.i02.

# Reference used for multi-function documentation: https://gist.github.com/jefferys/b79fe87314b0dc72fec9

# Note:
# These functions start with dots to avoid conflicting with other variable names.
# For example, .T so as to not be confused with the truth value T

# A word on notation:
# "[<-"(x, 3:5, value=13:15) is equivalent to x[3:5] <- 13:15

#' @rdname fuzzy_operators
#' @export
.T <- function(x,y,type="Zadeh"){ # "and"
  `[<-`(sets::fuzzy_logic(type)$T(x, y),
        xor(is.na(y), is.na(x)) & pmin.int(x, y, na.rm = TRUE) == 0, 0)
}

#' @rdname fuzzy_operators
#' @export
.S <- function (x, y,type="Zadeh"){ # "or"
  `[<-`(sets::fuzzy_logic(type)$S(x, y),
        xor(is.na(y), is.na(x)) & pmax.int(x, y, na.rm = TRUE) == 1, 1)
}

#' @rdname fuzzy_operators
#' @export
.N <- function (x,type="Zadeh") {
  fuzzy_logic(type)$N(x)
}

