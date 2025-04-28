#' Allow multiple species identifiers
#'
#' framrsquared functions are written around fram database species labels, "COHO" and "CHINOOK". This function translates alternate designations (lowercase, "chin" for "chinook") into those two forms.
#'
#' @param species Character atomic, either "COHO", "CHIN", or "CHINOOK", with any capitalization
#'
#' @return Character atomic, either "COHO" or "CHINOOK"
#' @keywords internal
standardize_species <- function(species){
  species = toupper(species)
  coho_names = c("COHO")
  chinook_names = c("CHINOOK", "CHIN")
  species <- rlang::arg_match(species, c(coho_names, chinook_names))
  if(species %in% coho_names){
    species = "COHO"
  } else if(species %in% chinook_names){
    species = "CHINOOK"
  }
  return(species)
}



validate_data_frame <- function(x, ..., arg = rlang::caller_arg(x), call = rlang::caller_env()) {
  # checks for data frame, stolen from the tidyr package
  if (!is.data.frame(x)) {
    cli::cli_abort("{.arg {arg}} must be a data frame, not {.obj_type_friendly {x}}.", ..., call = call)
  }
}
