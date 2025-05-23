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

#' Coho fishery information (PSC)
#'
#' Mapping of FRAM fishery_id to PSC fishery ID and name for Coho salmon, based on the AnnualReport R package.
#' @format A data frame with 197 rows and 5 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{fram_fishery_id}{Fishery ID in FRAM}
#'   \item{psc_fishery_id}{Corresponding ID for the psc fishery}
#'   \item{psc_group_code}{}
#'   \item{psc_fishery_name}{Name of PSC fishery ID for the psc fishery}
#'   \item{psc_fishery_order}{}
#' }
#' @source https://github.com/PSC-CoTC/AnnualReport
"fishery_coho_psc"

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
#' Mapping of FRAM stock_id to FRAM stock name for Coho salmon, taken from the `Stock` table of
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
#'   \item{limiting_stock_name}{Identifier for which of the limiting stock names of the Coho TAMM (sheet `2`) this stock contributes to, if any.}
#'   #'   \item{limiting_stock_name_tamm}{As `limiting_stock_name`, but exact match to name in TAMM.}
#' }
#' @source 2024NOF_CohoFRAMdatabase_distribution.mdb
"stock_coho_fram"

#' Coho stock information (PSC)
#'
#' Mapping of FRAM stock_id to PSC stock id and psc stock names, based on the AnnualReport R package.
#'
#' @format A data frame with 41 rows and 4 columns:
#' \describe{
#'   \item{species}{Species name}
#'   \item{fram_stock_id}{Coho stock id number in FRAM}
#'   \item{psc_stock_id}{Corresponding PSC stock ID}
#'   \item{psc_stock_name}{PSC stock name}
#' }
#' @source https://github.com/PSC-CoTC/AnnualReport
"stock_coho_psc"

#' Coho limiting stock
#'
#' Maps between the limiting stock of the Coho TAMM (e.g., 'Hood Canal Wild') and FRAM stock ids. Useful for summarizing impacts on stocks of concern.
#'
#' @format A tibble with 10 rows and 2 columns:
#' \describe{
#'   \item{name}{Name of the limiting stock}
#'   \item{name_tamm}{Exact match of limiting stock name in the TAMM}
#'   \item{stock_id_vec}{a list of numeric vectors, each containing all fram stock_id values for that TAMM limiting stock}
#' }
#' #' @source 2024 Pre-Season Chinook DB.mdb
"limiting_stock_coho"

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
#' @source 2024 Pre-Season Chinook DB.mdb
"bk_lookup_chin"
