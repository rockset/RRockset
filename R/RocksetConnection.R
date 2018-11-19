#' @include QueryRequestSql.R QueryRequest.R QueriesApi.R

NULL

#' S4 implementation of \code{DBIConnection} for Rockset
#'
#' @keywords internal
#' @export
setClass('RocksetConnection',
         contains='DBIConnection',
         slots=c(
           'apiclient'='ANY'
         )
)

#' @rdname RocksetConnection-class
#' @export
setMethod('show',
          'RocksetConnection',
          function(object) {
            cat(
              '<RocksetConnection: ', object@apiclient, '>\n',
              sep=''
            )
          }
)

#' @param conn A \code{\linkS4class{RocksetConnection}} object
#' @return [dbDisconnect] A \code{\link{logical}} value indicating success
#' @export
#' @rdname RocksetConnection-class
setMethod('dbDisconnect',
          'RocksetConnection',
          function(conn) {
            return(TRUE)
          }
)

#' @rdname RocksetConnection-class
#' @export
setMethod('dbSendQuery', c('RocksetConnection', 'character'), function(conn, statement, params = NULL) {
  dbSend(conn, statement, params)
})

dbSend <- function(conn, statement, params = NULL) {
  statement <- enc2utf8(statement)
  queryRequestSql <- QueryRequestSql$new(query=statement)
  
  # construct query request
  queryRequest <- QueryRequest$new(queryRequestSql)
  query <- QueriesApi$new()
  query$initialize(apiClient=conn@apiclient)
  
  resp <- query$query(body=queryRequest)
  if (typeof(resp$content) == 'character' &&
      resp$content == 'API client error') {
    stop('Query failed, response: ', resp$response)
  }
  
  rv <- new('RocksetResult',
            statement=statement,
            connection=conn,
            cursor=resp)
  return(rv)
}