#' Lookup table for FRAM to TOCAS
#'
#' @format ## `tocas_fram`
#' A data frame with 10,462 rows and 6 columns:
#' \describe{
#'   \item{fisher_type}{1 = Non-Treaty / 2 = Treaty}
#'   \item{gear}{Gear Code}
#'   \item{dispostion}{Dispostion. "COMM" = Commercial, "C&SF" = Ceremonial and Subsistence fishing, "ORGN" = , "Test" and "TEST" = Test fishery (?), TKHM = ??}
#'   \item{catch_area}{Catch area code, not zero-padded}
#'   \item{fishery_id}{FRAM fishery ID}
#'   \item{fishery_name}{FRAM fishery name}
#' }
#' @source <https://github.com/FRAMverse/framr/blob/master/xlsx/lu_coho.xlsx
"tocas_fram"

#' Lookup table for FRAM to WAFT
#'
#' @format ## `waft_fram`
#' A data frame with 10,462 rows and 6 columns:
#' \describe{
#'   \item{fishery_type}{1 = Non-Treaty / 2 = Treaty}
#'   \item{gear}{Gear Code}
#'   \item{dispostion}{Dispostion. "COMM" = Commercial, "C&SF" = Ceremonial and Subsistence fishing, "ORGN" = , "Test" and "TEST" = Test fishery (?), TKHM = ??}
#'   \item{catch_area}{Catch area code, zero-padded}
#'   \item{fishery_id}{FRAM fishery ID}
#'   \item{fishery_name}{FRAM fishery name}
#' }
#' @source <https://github.com/FRAMverse/framr/blob/master/xlsx/lu_coho.xlsx
"waft_fram"


#' Lookup table for FRAM to RMIS recoveries
#'
#' For more about the Regional Mark Information System (RMIS), see https://www.rmpc.org/.
#'
#' @format ## `rmis_fram`
#' A data frame with 225,390 rows and 4 columns:
#' \describe{
#'   \item{psc_code}{RMIS PSC Recovery Location}
#'   \item{gear}{Gear Code}
#'   \item{fishery_id}{FRAM fishery ID}
#'   \item{fishery_name}{FRAM fishery name}
#' }
#' @source <https://github.com/FRAMverse/framr/blob/master/xlsx/lu_coho.xlsx
"rmis_fram"

#' Chinook fishery information
#'
#' Mapping of fishery_id to fishery name for Chinook salmon, taken from the `Fishery` table of
#' the Chinook FRAM database.
#'
#' @format A data frame with 74 rows and 5 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{version_number}{}
#'   \item{fishery_id}{Chinook fishery id number in FRAM}
#'   \item{fishery_name}{Chinook fishery name in FRAM}
#'   \item{fishery_title}{consistent and more human readable version of `fishery_name`}
#' }
#' @source 2024 Pre-Season Chinook DB.mdb
"fishery_chinook_fram"


#' Coho fishery information
#'
#' Mapping of fishery_id to fishery name for Coho salmon, taken from the `Fishery` table of
#' the Coho FRAM database.
#' @format A data frame with 198 rows and 5 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{version_number}{}
#'   \item{fishery_id}{Coho fishery id number in FRAM}
#'   \item{fishery_name}{Coho fishery name in FRAM}
#'   \item{fishery_title}{consistent and more human readable version of `fishery_name`}
#' }
#' @source 2024NOF_CohoFRAMdatabase_distribution.mdb
"fishery_coho_fram"

#' Chinook stock information
#'
#' Mapping of stock_id to stock name for Chinook salmon, taken from the `Stock` table of
#' the Chinook FRAM database.
#'
#' @format A data frame with 78 rows and 7 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{stock_version}{}
#'   \item{stock_id}{Chinook stock id number in FRAM}
#'   \item{production_region_number}{}
#'   \item{management_unit_number}{}
#'   \item{stock_name}{Chinook stock name in FRAM}
#'   \item{stock_long_name}{`stock_name` but more human readable}
#' }
#' @source 2024 Pre-Season Chinook DB.mdb
"stock_chinook_fram"

#' Coho stock information
#'
#' Mapping of stock_id to stock name for Coho salmon, taken from the `Stock` table of
#' the Coho FRAM database.
#'
#' @format A data frame with 78 rows and 7 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{stock_version}{}
#'   \item{stock_id}{Coho stock id number in FRAM}
#'   \item{production_region_number}{}
#'   \item{management_unit_number}{}
#'   \item{stock_name}{Coho stock name in FRAM}
#'   \item{stock_long_name}{`stock_name` but more human readable}
#' }
#' @source 2024NOF_CohoFRAMdatabase_distribution.mdb
"stock_coho_fram"


#' Chinook timestep information stock information
#'
#' Mapping of timestep numbers to dates in the year, taken from the `TimeStep` table of
#' the Chinook FRAM database
#'
#' @format A data frame with 4 rows and 5 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{version_number}{}
#'   \item{time_step_id}{id number for the time step}
#'   \item{time_step_name}{Span of each timestep. Timesteps start on the first of the month, and end on the last of the month. Note that `Oct-Apr-2` is highlighting that timestep 4 runs from October of the current year to April of the NEXT year (equivalent to timestep 1 of the following year).}
#'   \item{time_step_title}{`time_step_name`, but months are written out}
#' }
#' @source 2024 Pre-Season Chinook DB.mdb
"timestep_chinook_fram"

#' Coho timestep information stock information
#'
#' Mapping of timestep numbers to dates in the year, taken from the `TimeStep` table of
#' the Chinook FRAM database
#'
#' @format A data frame with 5 rows and 5 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{version_number}{}
#'   \item{time_step_id}{id number for the time step}
#'   \item{time_step_name}{Span of each timestep. Timesteps start on the first of the month, and end on the last of the month.}
#'   \item{time_step_title}{`time_step_name`, but months are written out consistently}
#' }
#' @source 2024NOF_CohoFRAMdatabase_distribution.mdb
"timestep_coho_fram"

#' Lookup table for Chinook stock IDs from BkFRAM to normal FRAM
#'
#' This table is based on Chinook stock tables from pre-season 2024. Additional stock may
#' be added in the future (splitting out stock aggregates). The `bk_lookupfun_chin()` function accommodates
#' this.
#'
#' @format
#' A data frame with 116 rows and 3 columns:
#' \describe{
#'   \item{stock_name_bk}{Stock name}
#'   \item{bk_stock_id }{Stock ID in the BackwardsFRAM table}
#'   \item{stock_id}{Stock ID anywhere else in FRAM and TAMM}
#' }
"bk_lookup_chin"
