
# How to update data(2) : Preprocessing of data


# 1. data/20200630.csv
library(dplyr)
library(data.table)
covidSupp.raw <- read.csv("data/covidSupp_20200630.csv", header=TRUE) #[, -1]
covidSupp <- setnames(covidSupp.raw, old = c("일련번호","지역","업력","대출년도","대출월","대출금액.백만원.","업종"), new = c("no","region","startup.year","year","month","loan.krw1mil","industry"))

# change region name
covidSupp$region <- factor(covidSupp$region, labels = c("Gangwon", "Gyeonggi", "Gyeongnam", "Gyeongbuk", "Gwangju", "Daegu", "Daejeon", "Busan", "Seoul", "Sejong", "Ulsan", "Incheon", "Jeonnam", "Jeonbuk ","Jeju", "Chungnam", "Chungbuk"))

# change startup year        #10년미만 15년미만 1년미만 20년미만 20년이상 3년미만 5년미만 7년미만
covidSupp$startup.year <- factor(covidSupp$startup.year, labels =  c(10, 15, 1, 20, 99, 3, 5, 7))
covidSupp$startup.year <- as.integer(covidSupp$startup.year)

# Levels: 금속 기계 기타 섬유 식료 유통 잡화 전기 전자 정보 화공
covidSupp$industry <- factor(covidSupp$industry, labels = c("Metal", "Machinery", "Other", "Textiles", "Food", "Distribution", "Goods", "Electricity", "Electronic", "Information", "ChemicalEngineering"))

usethis::use_data(covidSupp)
#load("data/covidSupp.rda")
#View(covidSupp)


# 2. dataname <- c('covidInf', 'covidSidoInf', 'covidGenAgeCaseInf')

covidInf <- read.csv("data/covidInf.csv", header=TRUE)
usethis::use_data(covidInf)

covidSidoInf <- read.csv("data/covidSidoInf.csv", header=TRUE)
usethis::use_data(covidSidoInf)

covidGenAgeCaseInf <- read.csv("data/covidGenAgeCaseInf.csv", header=TRUE)
usethis::use_data(covidGenAgeCaseInf)

#load("data/covidSupp.rda")
#View(covidSupp)
