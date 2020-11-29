
# How to update data(1) : How to obtain raw data

# 1. following file is downloaded from xxx
# data/20200630.csv

# 2. Using following script, you can download 'covidInf.csv', 'covidSidoInf.csv', 'covidGenAgeCaseInf.csv'  files.
# Note that you need a myKey which can be get from http://openapi.data.go.kr/  (login is required)


# 아래 라인을 실행하면 '.Renviron' 파일이 새로운 탭으로 열립니다
usethis::edit_r_environ()

# RStudio를 재부팅하고 아래 라인을 실행하면 콘솔 창에 인증키가 출력됩니다.
Sys.getenv('DATAGOKR_TOKEN')

# 일반 인증키를 저장합니다.
myKey <- Sys.getenv('DATAGOKR_TOKEN')

# will be delete
myKey = '1kOQmLVq7NaAzCs6bKhWf%2FDY%2FMzN0TVZ6gzNhm7x3iem32r6%2FygMLBUNua%2FHfp39lNR3igaTebRxI9PPHQUTow%3D%3D'


# 필요한 패키지를 불러옵니다.
library(tidyverse)
library(httr)
library(rvest)
library(jsonlite)



getRawData <- function(URL, fname, myKey) {
  datCovid <-  NULL

  res <- GET(
    url = URL,
    query = list(
      serviceKey = I(x = myKey),
      pageNo = 1,
      numOfRows = 10,
      startCreateDt = '20200310',
      endCreateDt = '20201128'
    )
  )
  res %>%
    content(as = 'text', encoding = 'UTF-8') %>%
    jsonlite::fromJSON() -> json

  #str(object = json)

  datCovid <- json$response$body$items$item
  #print(x = datCovid)

  #View(datCovid)

  write.csv(datCovid, file = fname)
  return(datCovid)
}

URLpart <-
  c('http://openapi.data.go.kr/openapi/service/rest/Covid19/')
URLsubparts <-
  c('getCovid19InfStateJson',
    'getCovid19SidoInfStateJson',
    'getCovid19GenAgeCaseInfJson'
  )
dataname <- c('covidInf', 'covidSidoInf', 'covidGenAgeCaseInf')
i <- 0
for (i in 1:3) {

  URL <- paste(URLpart[1], URLsubparts[i], sep = "")
  fname <- paste('rawdata/', dataname[i], '.csv', sep = "")
  getRawData(URL, fname, myKey)

}


