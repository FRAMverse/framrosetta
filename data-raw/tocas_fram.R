# read data
data <- readr::read_csv(here::here('data-raw/fram_tocas.csv')) |>
  janitor::clean_names()

tocas_fram <- data |>
  tidyr::separate_longer_delim(disposition, delim = ',') |>
  tidyr::separate_longer_delim(gear, delim = ',') |>
  dplyr::mutate(
    gear = stringr::str_trim(gear)
    ) |>
  dplyr::select(fisher_type,
                gear,
                disposition,
                catch_area,
                fishery_id,
                fishery_name = name_drop)

usethis::use_data(tocas_fram, overwrite = TRUE)
