data <- readr::read_csv(here::here('data-raw/rmis_fram.csv')) |>
  janitor::clean_names()

# checking dupes
data |>
  dplyr::count(location_code, psc_code, fishery_id, fishery_name, gear) |>
  dplyr::filter(n > 1)

rmis_fram <-data |>
  dplyr::rowwise() |>
  dplyr::mutate(
    nest_gear = list(seq(gear * 10, ((gear + 1) * 10) -1))
  ) |>
  tidyr::unnest(nest_gear) |>
  dplyr::select(psc_code, fishery_id, fishery_name, gear = nest_gear)

rmis_fram |>
  dplyr::count(location_code, fishery_id, nest_gear) |>
  dplyr::filter(n > 1)


usethis::use_data(rmis_fram, overwrite = TRUE)
