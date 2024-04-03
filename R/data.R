#' Lookup table for FRAM to TOCAS
#'
#' @format ## `tocas_fram`
#' A data frame with 10,462 rows and 6 columns:
#' \describe{
#'   \item{fishery_type}{1 = Non-Treaty / 2 = Treaty}
#'   \item{gear} {Gear Code}
#'   \item{dispostion}{Dispostion - Commerical, Ceremonial Etc...}
#'   \item{catch_area}{Catch area code, not zero-padded}
#'   \item{fishery_id}{FRAM fishery ID}
#'   \item{fishery_name} {FRAM fishery name}
#' }
#' @source <https://github.com/FRAMverse/framr/blob/master/xlsx/lu_coho.xlsx
"tocas_fram"

#' Lookup table for FRAM to WAFT
#'
#' @format ## `waft_fram`
#' A data frame with 10,462 rows and 6 columns:
#' \describe{
#'   \item{fishery_type}{1 = Non-Treaty / 2 = Treaty}
#'   \item{gear} {Gear Code}
#'   \item{dispostion}{Dispostion - Commerical, Ceremonial Etc...}
#'   \item{catch_area}{Catch area code, zero-padded}
#'   \item{fishery_id}{FRAM fishery ID}
#'   \item{fishery_name} {FRAM fishery name}
#' }
#' @source <https://github.com/FRAMverse/framr/blob/master/xlsx/lu_coho.xlsx
"waft_fram"


#' Lookup table for FRAM to RMIS recoveries
#'
#' @format ## `rmis_fram`
#' A data frame with 225,390 rows and 4 columns:
#' \describe{
#'   \item{psc_code}{RMIS PSC Recovery Location}
#'   \item{gear} {Gear Code}
#'   \item{fishery_id}{FRAM fishery ID}
#'   \item{fishery_name} {FRAM fishery name}
#' }
#' @source <https://github.com/FRAMverse/framr/blob/master/xlsx/lu_coho.xlsx
"rmis_fram"
