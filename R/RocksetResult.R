#' @include RocksetConnection.R Response.R RocksetCursor.R

#' Class to represent a Rockset Result
#' @slot connection The connection object associated with the result
#' @slot cursor Cursor for iterating over the results
#' @export
setClass('RocksetResult',
         contains='DBIResult',
         slots=c(
           'connection'='RocksetConnection',
           'cursor'='RocksetCursor'
         )
)

fetchAll <- function(res) {
  res$cursor
}

#' @rdname RocksetResult-class
#' @export
setMethod('dbFetch', 'RocksetResult', function(res, n = -1) {
  if (length(n) != 1 || n < -1) stop("n must be non-negative or -1")

  if (n == -1) {
    return(res@cursor$fetchAll())
  }
  
  return(res@cursor$fetchCount(n))
})

#' @rdname RocksetResult-class
#' @export
setMethod('dbClearResult',
          c('RocksetResult'),
          function(res) {
            # clear results here
            res@cursor$reset()
            return(TRUE)
          }
)

#' @rdname RocksetResult-class
#' @export
setMethod('dbHasCompleted', c('RocksetResult'), function(res) {
  return(res@cursor$hasCompleted())
})