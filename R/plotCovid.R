#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param covidSupp PARAM_DESCRIPTION
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

pltCovidInf <- function(covidSupp){
  loan.krw1mil <- startup.year <- mean_loan.krw1mil <- NULL

  df_loan.krw1mil <- covidSupp %>%

    dplyr::group_by(startup.year) %>%
    dplyr::summarise(mean_loan.krw1mil = mean(loan.krw1mil))

  #df_loan.krw1mil

   ggplot(data = df_loan.krw1mil, aes(
     x = stats::reorder(startup.year,-mean_loan.krw1mil),
     y = mean_loan.krw1mil
   )) + geom_col()

  #ggplot(data = covidSupp, aes(x = month, y = loan.krw1mil)) + geom_line()

  #ggplot(data = covidSupp, aes(x = reorder(industry,-loan.krw1mil), y = loan.krw1mil)) + geom_boxplot()

  #ggplot(data = covidSupp, aes(x = reorder(region,-loan.krw1mil), y = loan.krw1mil)) + geom_boxplot())

}

#pltCovidInf(covidSupp)
