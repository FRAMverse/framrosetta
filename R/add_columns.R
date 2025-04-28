#' Add `fishery_label` column to describe fisheries of dataframe
#'
#' Streamlined version of using `left_join`, `rename`, and `relocate` to add human-readable text to a dataframe with fishery_id or similar columns.
#' Automatically detects species and `fishery_id` column; user can specify species or alternative name for fishery_id column if needed.
#'
#' @param .data Dataframe containing `fishery_id` column (or analogous column with different name specied by `fisheries_col` argument)
#' @param species character atomic identifying either "CHINOOK" or "COHO" (or variations of those). Defaults to `NULL`; only needed if `.data` does not have species defined as an attribute. Tables read from a fram database using `framrsquared` package automatically have appropriate species attribute.
#' @param fisheries_col character atomic identifying the column treated as containing fishery_id values Defaults to `fishery_id`.
#'
#' @return Data frame with additional column `fishery_label`
#' @export
#'
#' @examples
#' ## create example data
#' dat = data.frame(fishery_id = sample(1:73, size = 10, replace = TRUE))
#' ## Add fishery label
#' dat |> label_fisheries(species = "CHINOOK")
#'
label_fisheries <- function(.data, species = NULL, fisheries_col = "fishery_id"){
  validate_data_frame(.data)
  ## check if .dat has fisheries_col column. Error if not.
  if(!fisheries_col %in% colnames(.data)){
    cli::cli_abort('`fisheries_col` ({fisheries_col}) column must be present in dataframe.')
  }

  ## check if species attribute is present or species is defined
  if(is.null(species)){
    if(!is.null(attr(.data, 'species'))){
      species <- attr(.data, 'species')
    } else {
      cli::cli_abort('Table metadata missing and `species` argument missing.')
    }
  }
  species <-  standardize_species(species)

  ## check if fisheries_col has legal entries given species
  if(species == "CHINOOK"){
    max_int = max(framrosetta::fishery_chinook_fram$fishery_id)
  }
  if(species == "COHO"){
    max_int = max(framrosetta::fishery_coho_fram$fishery_id)
  }
  if(!is.numeric(.data[[fisheries_col]])){
    cli::cli_abort('`fisheries_col` column ({fisheries_col}) must be numeric. Check `.data` object or specify correct column with `fisheries_col`')
  }
  if(!all(.data[[fisheries_col]] %in% c(1:max_int, NA))){
    cli::cli_abort('`fisheries_col` column ({fisheries_col}) must only have legal fisheries ID numbers for this species ({species}): integers between 1 and {max_int}. Did you specify the correct column and species?')
  }

  label_map <- "fishery_id"
  names(label_map) = fisheries_col

  if("fishery_label" %in% names(.data)){
    cli::cli_alert_warning("`label_fisheries` adds a 'fishery_label' column listing fishery names, but `fishery_label` already exists in dataframe. Function behavior may be strange; consider removing `fishery_label` column from `.data` argument.")
  }

  ## Identify appropriate fishery lookup table
  if(species == "CHINOOK"){
    lut_use <- framrosetta::fishery_chinook_fram
  }
  if(species == "COHO"){
    lut_use <- framrosetta::fishery_coho_fram
  }

  ## use fram_rosetta join to add fishery_label column
  .data |>
    dplyr::left_join(lut_use |>
                       dplyr::select("fishery_id",
                              "fishery_label" = "fishery_title"),
                     by = label_map)|>
    dplyr::relocate(.data$fishery_label,
                    .after = {{fisheries_col}})
}


#' Add `stock_label` column to describe fisheries of dataframe
#'
#' Streamlined version of using `left_join`, `rename`, and `relocate` to add human-readable text to a dataframe with stock_id or similar columns.
#' Automatically detects species and `stock_id` column; user can specify species or alternative name for stock_d column if needed.
#'
#' @param .data Dataframe containing `stock_id` column (or analogous column with different name specied by `stocks_col` argument)
#' @param species character atomic identifying either "CHINOOK" or "COHO" (or variations of those). Defaults to `NULL`; only needed if `.data` does not have species defined as an attribute. Tables read from a fram database using `framrsquared` package automatically have appropriate species attribute.
#' @param stocks_col character atomic identifying the column treated as containing stock_id values Defaults to `stock_id`.
#'
#' @return Data frame with additional column `stock_label`
#' @export
#'
#' @examples
#' ## create example data
#' dat = data.frame(stock_id = sample(1:73, size = 10, replace = TRUE))
#' ## Add stock information
#' dat |> label_stocks(species = "CHINOOK")
#'
label_stocks <- function(.data, species = NULL, stocks_col = "stock_id"){
  validate_data_frame(.data)
  ## check if .dat has fisheries_col column. Error if not.
  if(!stocks_col %in% colnames(.data)){
    cli::cli_abort('`stocks_col` ({stocks_col}) column must be present in dataframe.')
  }

  ## check if species attribute is present or species is defined
  if(is.null(species)){
    if(!is.null(attr(.data, 'species'))){
      species <- attr(.data, 'species')
    } else {
      cli::cli_abort('Table metadata missing and `species` argument missing.')
    }
  }
  species <-  standardize_species(species)

  ## check if fisheries_col has legal entries given species
  if(species == "CHINOOK"){
    max_int = max(framrosetta::stock_chinook_fram$stock_id)
  }
  if(species == "COHO"){
    max_int = max(framrosetta::stock_coho_fram$stock_id)
  }
  if(!is.numeric(.data[[stocks_col]])){
    cli::cli_abort('`stocks_col` column ({stocks_col}) must be numeric. Check `.data` object or specify correct column with `stocks_col`')
  }
  if(!all(.data[[stocks_col]] %in% c(1:max_int, NA))){
    cli::cli_abort('`stocks_col` column ({stocks_col}) must only have legal fisheries ID numbers for this species ({species}): integers between 1 and {max_int}. Did you specify the correct column and species?')
  }

  label_map <- "stock_id"
  names(label_map) = stocks_col

  if("stock_label" %in% names(.data)){
    cli::cli_alert_warning("`label_stocks` adds a 'stock_label' column listing stock names, but `stock_label` already exists in dataframe. Function behavior may be strange; consider removing `stock_label` column from `.data` argument.")
  }

  ## Identify appropriate stock lookup table
  if(species == "CHINOOK"){
    lut_use <- framrosetta::stock_chinook_fram
  }
  if(species == "COHO"){
    lut_use <- framrosetta::stock_coho_fram
  }

  ## use fram_rosetta join to add stock_label column
  .data |>
    dplyr::left_join(lut_use |>
                       dplyr::select("stock_id",
                                     "stock_label" = "stock_long_name"),
                     by = label_map)|>
    dplyr::relocate(.data$stock_label,
                    .after = {{stocks_col}})
}
