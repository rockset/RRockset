# REST API
#
# Rockset's REST API allows for creating and managing all resources in Rockset. Each supported endpoint is documented below.  All requests must be authorized with a Rockset API key, which can be created in the [Rockset console](https://console.rockset.com). The API key must be provided as `ApiKey <api_key>` in the `Authorization` request header. For example: ``` Authorization: ApiKey aB35kDjg93J5nsf4GjwMeErAVd832F7ad4vhsW1S02kfZiab42sTsfW5Sxt25asT ```  All endpoints are only accessible via https.  Build something awesome!
#
# OpenAPI spec version: v1
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' ApiClient Class
#'
#' Generic API client for Swagger client library builds.
#' Swagger generic API client. This client handles the client-
#' server communication, and is invariant across implementations. Specifics of
#' the methods and models for each application are generated from the Swagger
#' templates.
#'
#' NOTE: This class is auto generated by the swagger code generator program.
#' Ref: https://github.com/swagger-api/swagger-codegen
#' Do not edit the class manually.
#'
#' @export
ApiClient  <- R6::R6Class(
  'ApiClient',
  public = list(
    basePath = "https://api.rs2.usw2.rockset.com",
    apikey = NULL,
    configuration = NULL,
    initialize = function(basePath, apikey, configuration){
        if (!missing(basePath)) {
            self$basePath <- basePath
        }
      
        if (!missing(apikey)) {
            self$apikey <- apikey
        }
      
        if (!missing(configuration)) {
            self$configuration <- configuration
        }
    },
    callApi = function(url, method, queryParams, headerParams, body, ...){
        headers <- httr::add_headers(headerParams)
        headers <- httr::add_headers(.headers = c("Authorization"= paste("ApiKey ", self$apikey), 
                                                  'Content-Type' = 'application/json',
                                                  'User-Agent' = 'R-lang',
                                                  'x-rockset-version' = '0.6.0'))
        if (method == "GET") {
            httr::GET(url, queryParams, headers, ...)
        }
        else if (method == "POST") {
            httr::POST(url, queryParams, headers, body = body, ...)
        }
        else if (method == "PUT") {
            httr::PUT(url, queryParams, headers, body = body, ...)
        }
        else if (method == "PATCH") {
            httr::PATCH(url, queryParams, headers, body = body, ...)
        }
        else if (method == "HEAD") {
            httr::HEAD(url, queryParams, headers, ...)
        }
        else if (method == "DELETE") {
            httr::DELETE(url, queryParams, headers, ...)
        }
        else {
            stop("http method must be `GET`, `HEAD`, `OPTIONS`, `POST`, `PATCH`, `PUT` or `DELETE`.")
        }
    }
  )
)
