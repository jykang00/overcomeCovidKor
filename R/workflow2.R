
library(dplyr)
covidSupp_org <- read.csv("중소벤처기업진흥공단_코로나19 피해기업 지원현황_20200630.csv", stringsAsFactors = T)[, -1]

# change column name
old <- c("지역","업력","대출년도","대출월","대출금액.백만원.","업종")
new <- c("region","startup.year","year","month","loan.krw1mil","industry")
covidSupp <- covidSupp_org %>% rename_at(vars(old), ~ new)

# change region name
#       강원     경기       경남         경북         광주      대구      대전        부산     서울    세종      울산      인천       전남      전북        제주     충남      충북
#c("Gangwon", "Gyeonggi", "Gyeongnam", "Gyeongbuk", "Gwangju", "Daegu", "Daejeon", "Busan", "Seoul", "Sejong", "Ulsan", "Incheon", "Jeonnam", "Jeonbuk ","Jeju", "Chungnam", "Chungbuk"))
covidSupp$region <- factor(covidSupp$region, labels =
                             c("Gangwon", "Gyeonggi", "Gyeongnam", "Gyeongbuk", "Gwangju", "Daegu", "Daejeon", "Busan", "Seoul", "Sejong", "Ulsan", "Incheon", "Jeonnam", "Jeonbuk ","Jeju", "Chungnam", "Chungbuk"))

# change startup year
#10년미만 15년미만 1년미만 20년미만 20년이상 3년미만 5년미만 7년미만
covidSupp$startup.year <- factor(covidSupp$startup.year, labels =  c(10, 15, 1, 20, 99, 3, 5, 7))

# Levels: 금속 기계 기타 섬유 식료 유통 잡화 전기 전자 정보 화공
covidSupp$industry <- factor(covidSupp$industry, labels =
                             c("Metal", "Machinery", "Other", "Textiles", "Food", "Distribution", "Goods", "Electricity", "Electronic", "Information", "ChemicalEngineering"))

usethis::use_data(covidSupp)
load("data/covidSupp.rda")
View(covidSupp)

#usethis::use_data(covidSupp_org)
#load("data/covidSupp_org.rda")
#View(covidSupp_org)
