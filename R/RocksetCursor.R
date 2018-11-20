
RocksetCursor <- setRefClass('RocksetCursor',
  fields = c(
    'query'='ANY',
    'statement'='ANY',
    'parameter'='ANY',
    'skip'= 'numeric',
    'nt'='numeric',
    'results'='ANY'
  ),
  methods = list(
    initialize = function(q, s, p) {
      initFields(
        query=q,
        statement=s,
        parameter=p,
        skip=0,
        nt=-1,
        results=data.frame()
      )
    },
    fetchAll=function() {
      return(runQuery())
    },
    fetchCount=function(n=10000) {
      nt <<- n
      results <<- runQuery()
      if (!is.null(results)) {
        skip <<- skip + n 
      }
      return(results)
    },
    hasCompleted=function() {
      return (nt > nrow(results))
    },
    runQuery=function() {
      lstatement <- statement
      if (nt != -1) {
        lstatement = paste0(statement, ' LIMIT ', nt, ' OFFSET ', skip)
      }
      queryRequestSql <- QueryRequestSql$new(query=lstatement, parameters=parameter)
      # construct query request
      queryRequest <- QueryRequest$new(queryRequestSql)
      
      resp <- query$query(body=queryRequest)
      if (typeof(resp$content) == 'character' &&
          (resp$content == 'API client error' ||
           resp$content == 'API server error')) {
        stop('Query failed, response: ', resp$response)
      }
      as.data.frame(resp$content$results)
    },
    reset=function() {
      skip <<- 0
      nt <<- -1
      results <<- data.frame()
    }
  ))