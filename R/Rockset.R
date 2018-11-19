#' @include RocksetDriver.R
NULL

#' Connect to Rockset
#' @return [Rockset] A \code{\linkS4class{RocksetDriver}} object
#' @rdname Rockset
#' @export
Rockset <- function(...) {
  return(new('RocksetDriver'))
}