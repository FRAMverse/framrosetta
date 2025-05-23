% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/integrity.R
\name{standardize_species}
\alias{standardize_species}
\title{Allow multiple species identifiers}
\usage{
standardize_species(species)
}
\arguments{
\item{species}{Character atomic, either "COHO", "CHIN", or "CHINOOK", with any capitalization}
}
\value{
Character atomic, either "COHO" or "CHINOOK"
}
\description{
framrsquared functions are written around fram database species labels, "COHO" and "CHINOOK". This function translates alternate designations (lowercase, "chin" for "chinook") into those two forms.
}
\keyword{internal}
