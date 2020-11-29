#' @title pltcovidSupp
#' @description plot function for CovidInf data
#' @param CovidInf name of dataset
#' @param plotopt options for plot
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#'  library(overcomeCovidKor)
#'  pltcovidSupp(covidSupp, 1)
#' @seealso
#'  \code{\link[dplyr]{group_by}}
#' @rdname pltcovidSupp
#' @export
#' @importFrom dplyr group_by summarise
#' @importFrom magrittr %>%
#' @import ggplot2


pltcovidSupp <- function(covidSupp, plotopt ) {
  loan.krw1mil <- startup.year <- mean_loan.krw1mil  <- NULL
  industry <- month <- region <- NULL

  df_loan.krw1mil <- covidSupp %>%
    dplyr::group_by(startup.year) %>%
    dplyr::summarise(mean_loan.krw1mil = mean(loan.krw1mil))

  #df_loan.krw1mil

  if (plotopt == 1) {
    ggplot(data = df_loan.krw1mil, aes(
      x = stats::reorder(startup.year, -mean_loan.krw1mil),
      y = mean_loan.krw1mil
    )) + geom_col()
  } else if (plotopt == 2) {
    ggplot(data = covidSupp, aes(x = stats::reorder(industry, -loan.krw1mil), y = loan.krw1mil)) + geom_boxplot() + labs(x="Industry", y="Loan (KRW 1mil)") +theme(axis.text.x=element_text(angle=45, hjust=1))
  } else if (plotopt == 3) {
    ggplot(data = covidSupp, aes(x = stats::reorder(region, -loan.krw1mil), y = loan.krw1mil)) + geom_boxplot() + labs(x="Region", y="Loan (KRW 1 mil)") +theme(axis.text.x=element_text(angle=45, hjust=1))
  } else if (plotopt == 4) {
    ggplot(data = covidSupp, aes(x = stats::reorder(month, -loan.krw1mil), y = loan.krw1mil)) + geom_boxplot() + labs(x="Month", y="Loan (KRW 1 mil)") +theme(axis.text.x=element_text(angle=45, hjust=1))
  }
}

#pltCovidInf(CovidInf)
