# REST API
#
# Rockset's REST API allows for creating and managing all resources in Rockset. Each supported endpoint is documented below.  All requests must be authorized with a Rockset API key, which can be created in the [Rockset console](https://console.rockset.com). The API key must be provided as `ApiKey <api_key>` in the `Authorization` request header. For example: ``` Authorization: ApiKey aB35kDjg93J5nsf4GjwMeErAVd832F7ad4vhsW1S02kfZiab42sTsfW5Sxt25asT ```  All endpoints are only accessible via https.  Build something awesome!
#
# OpenAPI spec version: v1
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' QueryResponseStats Class
#'
#' @field elapsed_time_ms 
#' @field rows_scanned 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
QueryResponseStats <- R6::R6Class(
  'QueryResponseStats',
  public = list(
    `elapsed_time_ms` = NULL,
    `rows_scanned` = NULL,
    initialize = function(`elapsed_time_ms`, `rows_scanned`){
      if (!missing(`elapsed_time_ms`)) {
        stopifnot(is.numeric(`elapsed_time_ms`), length(`elapsed_time_ms`) == 1)
        self$`elapsed_time_ms` <- `elapsed_time_ms`
      }
      if (!missing(`rows_scanned`)) {
        stopifnot(is.numeric(`rows_scanned`), length(`rows_scanned`) == 1)
        self$`rows_scanned` <- `rows_scanned`
      }
    },
    toJSON = function() {
      QueryResponseStatsObject <- list()
      if (!is.null(self$`elapsed_time_ms`)) {
        QueryResponseStatsObject[['elapsed_time_ms']] <- self$`elapsed_time_ms`
      }
      if (!is.null(self$`rows_scanned`)) {
        QueryResponseStatsObject[['rows_scanned']] <- self$`rows_scanned`
      }

      QueryResponseStatsObject
    },
    fromJSON = function(QueryResponseStatsJson) {
      QueryResponseStatsObject <- jsonlite::fromJSON(QueryResponseStatsJson)
      if (!is.null(QueryResponseStatsObject$`elapsed_time_ms`)) {
        self$`elapsed_time_ms` <- QueryResponseStatsObject$`elapsed_time_ms`
      }
      if (!is.null(QueryResponseStatsObject$`rows_scanned`)) {
        self$`rows_scanned` <- QueryResponseStatsObject$`rows_scanned`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "elapsed_time_ms": %d,
           "rows_scanned": %d
        }',
        self$`elapsed_time_ms`,
        self$`rows_scanned`
      )
    },
    fromJSONString = function(QueryResponseStatsJson) {
      QueryResponseStatsObject <- jsonlite::fromJSON(QueryResponseStatsJson)
      self$`elapsed_time_ms` <- QueryResponseStatsObject$`elapsed_time_ms`
      self$`rows_scanned` <- QueryResponseStatsObject$`rows_scanned`
    }
  )
)