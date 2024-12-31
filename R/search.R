#' Search through fishery and stock lookup tables.
#'
#' @param pattern Character string of pattern to search for, case insensitive. If numeric instead, function will return the row with the corresponding stock or fishery ID.
#' @param species "CHINOOK" or "COHO
#'
#' @export
#'
#' @examples
#' fishery_search("kmz", "COHO")
#' fishery_search(50, "COHO")
#' stock_search("nooksack", "CHINOOK")
#' stock_search(21, "CHINOOK")
fishery_search <- function(pattern, species) {
  species.vec <- c("CHINOOK", "COHO")
  rlang::arg_match(species, species.vec)
  if(!(is.character(pattern) | is.numeric(pattern))){
    cli::cli_abort("`pattern` must be either a character vector (to search for fishery by name) or a numeric (to search for fishery by ID number).")
  }

  if (species == "CHINOOK") {
    lut <- framrosetta::fishery_chinook_fram
  }
  if (species == "COHO") {
    lut <- framrosetta::fishery_coho_fram
  }
  if (is.numeric(pattern)) {
    ind <- lut$fishery_id == pattern
  } else {
    ind <- grepl(pattern, lut$fishery_name, ignore.case = T) |
      grepl(pattern, lut$fishery_title, ignore.case = T)
  }
  return(lut[ind, ])
}


#' @rdname fishery_search
#' @export
stock_search <- function(pattern, species) {
  species.vec <- c("CHINOOK", "COHO")
  rlang::arg_match(species, species.vec)
  if(!(is.character(pattern) | is.numeric(pattern))){
    cli::cli_abort("`pattern` must be either a character vector (to search for stock by name) or a numeric (to search for stock by ID number).")
  }

  if (species == "CHINOOK") {
    lut <- framrosetta::stock_chinook_fram
  }
  if (species == "COHO") {
    lut <- framrosetta::stock_coho_fram
  }
  if (is.numeric(pattern)) {
    ind <- lut$stock_id == pattern
  } else {
    ind <- grepl(pattern, lut$stock_name, ignore.case = T) |
      grepl(pattern, lut$stock_long_name, ignore.case = T)
  }
  return(lut[ind, ])
}
