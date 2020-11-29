#' @title pltCovidInf
#' @description plot function for CovidInf data
#' @param CovidInf name of dataset
#' @param plotopt options for plot
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#'  library(overcomeCovidKor)
#'  pltCovidInf(covidSupp)
#' @seealso
#'  \code{\link[dplyr]{group_by}}
#' @rdname pltCovidInf
#' @export
#' @importFrom dplyr group_by summarise
#' @importFrom magrittr %>%
#' @import ggplot2


pltCovidInf <- function(CovidInf, plotopt = 1) {
  loan.krw1mil <- startup.year <- mean_loan.krw1mil  <- NULL
  industry <- month <- region <- NULL

  df_loan.krw1mil <- CovidInf %>%
    dplyr::group_by(startup.year) %>%
    dplyr::summarise(mean_loan.krw1mil = mean(loan.krw1mil))

  #df_loan.krw1mil

  if (plotopt == 1) {
    ggplot(data = df_loan.krw1mil, aes(
      x = stats::reorder(startup.year, -mean_loan.krw1mil),
      y = mean_loan.krw1mil
    )) + geom_col()
  } else if (plotopt == 1) {
    ggplot(data = CovidInf, aes(x = month, y = loan.krw1mil)) + geom_line()
  } else if (plotopt == 2) {
    ggplot(data = CovidInf, aes(x = reorder(industry,-loan.krw1mil), y = loan.krw1mil)) + geom_boxplot()
  } else if (plotopt == 3) {
    ggplot(data = CovidInf, aes(x = reorder(region,-loan.krw1mil), y = loan.krw1mil)) + geom_boxplot()
  }
}

#pltCovidInf(CovidInf)
