

library(usethis)

usethis::use_mit_license("Jiyoung Kang")
usethis::use_readme_md()

covid19_support <- read.csv("중소벤처기업진흥공단_코로나19 피해기업 지원현황_20200630.csv")

usethis::use_data(covid19_support)


load("data/covid19_support.rda")
View(covid19_support)
