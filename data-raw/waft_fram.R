# read data
data <- readr::read_csv(here::here('data-raw/fram_tocas.csv')) |>
  janitor::clean_names()

waft_fram <- data |>
  tidyr::separate_longer_delim(disposition, delim = ',') |>
  tidyr::separate_longer_delim(gear, delim = ',') |>
  dplyr::mutate(
    catch_area = stringr::str_pad(catch_area, 2, 'left', '0'),
    gear = stringr::str_trim(gear)
  ) |>
  dplyr::select(fisher_type,
                gear,
                disposition,
                catch_area,
                fishery_id,
                fishery_name = name_drop)

usethis::use_data(waft_fram, overwrite = TRUE)
