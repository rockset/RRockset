#' @include RocksetConnection.R Response.R
NULL

#' An S4 class to represent a Rockset Result
#' @slot statement The SQL statement sent to Rockset
#' @slot connection The connection object associated with the result
#' @slot cursor An internal implementation detail for keeping track of
#'  what stage a request is in
#' @keywords internal
#' @export
setClass('RocksetResult',
         contains='DBIResult',
         slots=c(
           'statement'='character',
           'connection'='RocksetConnection',
           'cursor'='ANY'
         )
)

#' @rdname RocksetResult-class
#' @export
setMethod('dbFetch', 'RocksetResult', function(res) {
  res@cursor$content$results
})

#' @rdname RocksetResult-class
#' @export
setMethod('dbClearResult',
          c('RocksetResult'),
          function(res) {
            return(TRUE)
          }
)