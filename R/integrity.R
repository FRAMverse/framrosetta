#' Clean variations on function names
#'
#' Takes a character string with putative species name corresponding to "CHINOOK" or "COHO" and returns exactly "CHINOOK" or "COHO".
#' Works by matching against predefined variations (different capitalizations, "chin" instead of "chinook"). Returns informative error if
#' species name does not match any of these variations. Intended for internal use, to streamline allowing variations of species in arguments.
#'
#' @param species character atomic
#' @param call argument to ensure error messages correctly point to the calling function rather than this one.
#'
#' @return either "COHO" or "CHINOOK"
clean_species <- function(species, call = rlang::caller_env()){
  species_vec <- c("CHINOOK", "CHIN", "Chin", "Chinook", "chinook", "chin",
                   "COHO", "Coho", "coho")
  rlang::arg_match(arg = species,
                   values = species_vec,
                   error_call = call)
  if(species %in% c("CHINOOK", "CHIN", "Chin", "Chinook", "chinook", "chin")){
    species_clean = "CHINOOK"
  }
  if (species %in% c("COHO", "Coho", "coho")) {
    species_clean = "COHO"
  }
  return(species_clean)
}



validate_data_frame <- function(x, ..., arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  # checks for data frame, stolen from the tidyr package
  if (!is.data.frame(x)) {
    cli::cli_abort("{.arg {arg}} must be a data frame, not {.obj_type_friendly {x}}.", ..., call = call)
  }
}
