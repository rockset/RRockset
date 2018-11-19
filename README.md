# RRockset

RRockset is a R DBI-based adapter for [Rockset](https://rockset.com/). RRockset supports only read operations.

## Installation
You'll need the `devtools` package in order to install RRockset. RRockset is available on [github](https://github.com/rockset/RRockset)

You can install the github version using:
```
devtools::install_github('rockset/RRockset')
```

## Example

```
library('DBI')
sql <- "select _id, kind from _events limit 5"
con <- dbConnect(RRockset::Rockset(),
                 apikey='<api-key>')
res <- dbSendQuery(con, sql)

# get all the documents
print(dbFetch(res))
```

## License
RRockset is licensed under the Apache License 2.0

