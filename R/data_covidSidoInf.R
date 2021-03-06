#' @title covidSidoInf: Corona19 City Current status of Korea
#' @description Corona19 City Current status of Korea obtained from http://openapi.data.go.kr/
#' @format A data frame with 5143 rows and 16 variables:
#' \describe{
#'   \item{\code{X}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{createDt}}{character Date and time of registration}
#'   \item{\code{deathCnt}}{integer the number of deaths}
#'   \item{\code{defCnt}}{integer number of confirmed infections}
#'   \item{\code{gubun}}{character name of city or do(prefecture) in Korean}
#'   \item{\code{gubunCn}}{character name of city or do(prefecture) in Chinese characters}
#'   \item{\code{gubunEn}}{character name of city or do(prefecture) in English}
#'   \item{\code{incDec}}{integer Number of increases and decreases compared to the previous day}
#'   \item{\code{isolClearCnt}}{integer Unisolated Number}
#'   \item{\code{isolIngCnt}}{integer Number of isolated people}
#'   \item{\code{localOccCnt}}{integer number of local occurrences}
#'   \item{\code{overFlowCnt}}{integer Number of inflow from abroad}
#'   \item{\code{qurRate}}{character incidence per 100,000 people}
#'   \item{\code{seq}}{integer Post number (infection status unique value)}
#'   \item{\code{stdDay}}{character state date}
#'   \item{\code{updateDt}}{character Update Date and Time Minute}
#'}
#' @details DETAILS
#'  data from Korea Ministry of Health and Welfare
#'  Corona19 City Current status inquiry service
#'  http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson
#'  You can find detailed description for this data from
#'  https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15043378
#'  check : defCnt, isolClearCnt
"covidSidoInf"
