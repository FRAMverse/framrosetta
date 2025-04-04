library(framrsquared)
library(tidyverse)

cli::cli_alert("Select full Chinook FRAM database to pull tables from")
path.chin <- file.choose()
file.chin <- gsub(".*[\\]", "", path.chin)
# path.chin = "C:/Repos/PeriodicReportData/2024 Pre-Season Chinook DB.mdb"
db <- framrsquared::connect_fram_db(path.chin)
if (db$fram_db_type == "transfer") {
  cli::cli_abort("Database must be full FRAM database, not transfer.")
}
if (db$fram_db_species == "COHO") {
  cli::cli_abort("Database must be Chinook FRAM database, not Coho.")
}

## Chinook ------------------------
stock_chinook_fram <- fetch_table(db, "Stock")
comment(stock_chinook_fram) <- c(description = paste0("`stock_chinook_fram` is a copy of the Stock table from a Chinook FRAM database (", file.chin, "), and can be used to map stock ID numbers to stock or vice versa. Note that TAMM and FRAM have slightly different stock ID numbers."))
fishery_chinook_fram <- fetch_table(db, "Fishery") |>
  filter(species == "CHINOOK")
comment(fishery_chinook_fram) <- c(description = paste0("`fishery_chinook_fram` is a copy of the Fishery table from a Chinook FRAM database (", file.chin, "), and can be used to map fishery ID numbers to fisheries or vice versa. Note that TAMM and FRAM have slightly different fishery ID numbers."))
timestep_chinook_fram <- fetch_table(db, "TimeStep") |>
  filter(species == "CHINOOK")
comment(timestep_chinook_fram) <- c(description = paste0("`timestep_chinook_fram` is a copy of the TimeStep table from a Chinook FRAM database (", file.chin, ")."))
disconnect_fram_db(db)

## Coho --------------------

cli::cli_alert("Select full Coho FRAM database to pull tables from")
path.coho <- file.choose()
file.coho <- gsub(".*[\\]", "", path.coho)
db <- framrsquared::connect_fram_db(path.coho)
if (db$fram_db_type == "transfer") {
  cli::cli_abort("Database must be full FRAM database, not transfer.")
}
if (db$fram_db_species == "CHINOOK") {
  cli::cli_abort("Database must be Coho FRAM database, not Chinook.")
}
stock_coho_fram <- fetch_table(db, "Stock") |>
  select(-stock_add)
comment(stock_coho_fram) <- c(description = paste0("`stock_coho_fram` is a copy of the Stock table from a coho FRAM database (", file.coho, "), and can be used to map stock ID numbers to stock or vice versa. Note that TAMM and FRAM have slightly different stock ID numbers."))
fishery_coho_fram <- fetch_table(db, "Fishery") |>
  select(-fish_add)
comment(fishery_coho_fram) <- c(description = paste0("`fishery_coho_fram` is a copy of the Fishery table from a coho FRAM database (", file.coho, "), and can be used to map fishery ID numbers to fisheries or vice versa. Note that TAMM and FRAM have slightly different fishery ID numbers."))
timestep_coho_fram <- fetch_table(db, "TimeStep") |>
  filter(species == "COHO")
comment(timestep_coho_fram) <- c(description = paste0("`timestep_coho_fram` is a copy of the TimeStep table from a coho FRAM database (", file.coho, ")."))

## Coho TRUNS
fram_tr <- function(fram_db, pattern, verbose = FALSE) {
  temp <- fram_db |>
    framrsquared::truns_stocks() |>
    filter(grepl(pattern, stock_name, ignore.case = TRUE))
  if (verbose) {
    print(knitr::kable(temp))
  }
  temp |>
    pull(stock_id) |>
    unique()
}
stil_fr <- db |> fram_tr("Stil.* Wild")
skag_fr <- db |> fram_tr("Skagit Wild")
sno_fr <- db |> fram_tr("Snoh.* Wild")
hc_fr <- db |> fram_tr("Hood Canal Wild")
jdf_fr <- db |> fram_tr("straits wild")
quil_fr <- db |> fram_tr("Quil fall wild")
hoh_fr <- db |> fram_tr("hoh wild")
queets_fr <- db |> fram_tr("queets wild")
grays_fr <- db |> fram_tr("Grays H. Wild")
thompson_fr <- db |> fram_tr("upper fraser wild")


limiting_stock_coho <- tibble(
  name = c(
    "Skagit wild",
    "Stillaguamish wild",
    "Snohomish wild",
    "Hood Canal wild",
    "Juan de Fuca wild",
    "Quileyte Fall wild",
    "Hoh wild",
    "Queets wild",
    "Grays Harbor wild",
    "Thompson / Upper Fraser wild"
  ),
  limiting_stock_name_tamm = c(
    "SKAGIT Wild",
    "STILLY Wild",
    "SNOHOM Wild",
    "HOOD CANAL Wild",
    "JUAN DE FUCA TRIBS Wild",
    "QUIL FALL Wild",
    "HOH Wild",
    "QUEETS Wild",
    "GRAYS HARBOR Wild",
    "THOMPSON"
  ),
  stock_id_vec = list(skag_fr, stil_fr, sno_fr, hc_fr, jdf_fr, quil_fr, hoh_fr, queets_fr, grays_fr, thompson_fr)
)

truns_join <- limiting_stock_coho |>
  unnest(stock_id_vec) |>
  rename(
    limiting_stock_name = name,
    stock_id = stock_id_vec
  )

stock_coho_fram <- stock_coho_fram |>
  left_join(truns_join)

disconnect_fram_db(db)

## Final Setup ----------------------

usethis::use_data(stock_chinook_fram,
  stock_coho_fram,
  fishery_chinook_fram, fishery_coho_fram,
  timestep_chinook_fram, timestep_coho_fram,
  limiting_stock_coho,
  overwrite = TRUE
)
cli::cli_alert("Update @source in data.R documentation! Files used:")
cli::cli_alert(file.chin)
cli::cli_alert(file.coho)
