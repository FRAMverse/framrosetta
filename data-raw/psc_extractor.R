library(tidyverse)

## updating files if desired -------------
if(FALSE){
  ## Update files from online.
  ## Note that if the files get moved on the github repo, or the branch gets relabeled, the following will not work.
  utils::download.file("https://raw.githubusercontent.com/PSC-CoTC/AnnualReport/refs/heads/master/csv/PSCStocks.csv",
                destfile = here::here("data-raw/PSCStocks.csv"),
                method = "curl", quiet = FALSE, mode = "w")
  utils::download.file("https://raw.githubusercontent.com/PSC-CoTC/AnnualReport/refs/heads/master/csv/PSCStockMap.csv",
                       destfile = here::here("data-raw/PSCStockMap.csv"),
                       method = "curl", quiet = FALSE, mode = "w")

  utils::download.file("https://raw.githubusercontent.com/PSC-CoTC/AnnualReport/refs/heads/master/csv/PSCFisheries.csv",
                       destfile = here::here("data-raw/PSCFisheries.csv"),
                       method = "curl", quiet = FALSE, mode = "w")
  utils::download.file("https://raw.githubusercontent.com/PSC-CoTC/AnnualReport/refs/heads/master/csv/PSCFisheryMap.csv",
                       destfile = here::here("data-raw/PSCFisheryMap.csv"),
                       method =  "curl", quiet = FALSE, mode = "w")
}


## PSC stocks ---------------
psc_stocks_names  <-  readr::read_csv(here::here("data-raw/PSCStocks.csv")) |>
  janitor::clean_names() |>
  select(psc_stock_id, psc_stock_name)

# use standard naming protocol: {content}_{species}_{source}
stock_coho_psc  <-  readr::read_csv(here::here("data-raw/PSCStockMap.csv")) |>
  janitor::clean_names() |>
  left_join(psc_stocks_names) |>
  mutate(species = "COHO", .before = fram_stock_id)

usethis::use_data(stock_coho_psc, overwrite = TRUE)

## PSC fisheries -----------------

psc_fishery_names  <-  readr::read_csv(here::here("data-raw/PSCFisheries.csv")) |>
janitor::clean_names() |>
  select(psc_group_code = group_code,
         psc_fishery_id,
         psc_fishery_name,
         psc_fishery_order)

fishery_coho_psc <- readr::read_csv(here::here("data-raw/PSCFisheryMap.csv")) |>
  janitor::clean_names() |>
  select(-id) |>
  left_join(psc_fishery_names, by = "psc_fishery_id") |>
  mutate(species = "COHO", .before = fram_fishery_id)

usethis::use_data(fishery_coho_psc, overwrite = TRUE)


