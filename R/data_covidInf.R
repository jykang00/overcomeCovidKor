#' @title covidInf: COVID19 infection information from Korea Ministry of Health and Welfare
#' @description Covid19InfStateJson dataset from http://openapi.data.go.kr
#' @format A data frame with 270 rows and 15 variables:
#' \describe{
#'   \item{\code{X}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{accDefRate}}{double Cumulative exchange rate}
#'   \item{\code{accExamCnt}}{integer Cumulative number of tests}
#'   \item{\code{accExamCompCnt}}{integer Number of cumulative tests completed}
#'   \item{\code{careCnt}}{integer Number of patients during treatment}
#'   \item{\code{clearCnt}}{integer Unisolated Number}
#'   \item{\code{createDt}}{character Date and time of registration}
#'   \item{\code{deathCnt}}{integer the number of deaths}
#'   \item{\code{decideCnt}}{integer number of confirmed infections}
#'   \item{\code{examCnt}}{integer Number of Inspections Progress}
#'   \item{\code{resutlNegCnt}}{integer Number of resulting negatives}
#'   \item{\code{seq}}{integer Post number (infection status unique value)}
#'   \item{\code{stateDt}}{integer state date}
#'   \item{\code{stateTime}}{character state time}
#'   \item{\code{updateDt}}{character Update Date and Time Minute}
#'}
#' @details
#' Covid19InfStateJson was obtained from
#' http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson.
#' To obtain this dataset, API key is required.
#' For detailed explanation of this data can be found at
#' https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15043376
"covidInf"
