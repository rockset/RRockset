# REST API
#
# Rockset's REST API allows for creating and managing all resources in Rockset. Each supported endpoint is documented below.  All requests must be authorized with a Rockset API key, which can be created in the [Rockset console](https://console.rockset.com). The API key must be provided as `ApiKey <api_key>` in the `Authorization` request header. For example: ``` Authorization: ApiKey aB35kDjg93J5nsf4GjwMeErAVd832F7ad4vhsW1S02kfZiab42sTsfW5Sxt25asT ```  All endpoints are only accessible via https.  Build something awesome!
#
# OpenAPI spec version: v1
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' QueryFieldType Class
#'
#' @field name 
#' @field type 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
QueryFieldType <- R6::R6Class(
  'QueryFieldType',
  public = list(
    `name` = NULL,
    `type` = NULL,
    initialize = function(`name`, `type`){
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`type`)) {
        stopifnot(is.character(`type`), length(`type`) == 1)
        self$`type` <- `type`
      }
    },
    toJSON = function() {
      QueryFieldTypeObject <- list()
      if (!is.null(self$`name`)) {
        QueryFieldTypeObject[['name']] <- self$`name`
      }
      if (!is.null(self$`type`)) {
        QueryFieldTypeObject[['type']] <- self$`type`
      }

      QueryFieldTypeObject
    },
    fromJSON = function(QueryFieldTypeJson) {
      QueryFieldTypeObject <- jsonlite::fromJSON(QueryFieldTypeJson)
      if (!is.null(QueryFieldTypeObject$`name`)) {
        self$`name` <- QueryFieldTypeObject$`name`
      }
      if (!is.null(QueryFieldTypeObject$`type`)) {
        self$`type` <- QueryFieldTypeObject$`type`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "name": %s,
           "type": %s
        }',
        self$`name`,
        self$`type`
      )
    },
    fromJSONString = function(QueryFieldTypeJson) {
      QueryFieldTypeObject <- jsonlite::fromJSON(QueryFieldTypeJson)
      self$`name` <- QueryFieldTypeObject$`name`
      self$`type` <- QueryFieldTypeObject$`type`
    }
  )
)
