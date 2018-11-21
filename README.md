# RRockset

RRockset is a R DBI-based adapter for [Rockset](https://rockset.com/). RRockset supports only read operations.

## Installation
You'll need the `devtools` package in order to install RRockset.
```
install.packages('devtools')
library('devtools')
```

RRockset is available on [github](https://github.com/rockset/RRockset).

You can install the github version using:
```
devtools::install_github('rockset/RRockset@v0.1.0')
```

## Example
You'll need an API Key to perform operations on Rockset. If you do not already have an account, please contact us at hello@rockset.com.


```
library('DBI')
sql <- "select _id, kind from _events limit 5"
con <- dbConnect(RRockset::Rockset(),
                 apikey='<api-key>')

# fetch the documents using dbSendQuery
res <- dbSendQuery(con, sql)
print(dbFetch(res))

# use dbGetQuery
res <- dbGetQuery(con, sql)
print(res)
```

Using parameters:
```
library('DBI')
sql <- "select _id, kind from _events where kind = :kind limit 5"
param1 <- list(name = "kind", type = "string", value = "ORGANIZATION")
params <- list(param1)
con <- dbConnect(RRockset::Rockset(),
                 apikey='<api-key>')

# fetch the documents
res <- dbSendQuery(con, sql, params)
print(dbFetch(res))
```

Fetch one chunk at a time:
```
library('DBI')
sql <- "select * from _events"
con <- dbConnect(RRockset::Rockset(), 
                 apikey='<api-key>')
res <- dbSendQuery(con, sql)
while(!dbHasCompleted(res)) {
  # fetch 10 documents at a time
  print(dbFetch(res, n = 10)) 
}

# clear the result
dbClearResult(res)
```

## License
RRockset is licensed under the Apache License 2.0

