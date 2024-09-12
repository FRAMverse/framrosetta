library(framrsquared)
library(tidyverse)
library(readxl)

cli::cli_alert("Reading Chinook backwards fram lookup from data-raw/BKFRAM_Look_up.xlsx")
raw = readxl::read_excel("data-raw/BKFRAM_Look_Up.xlsx")
bk_lookup_chin = raw |>
  rename("stock_name_bk" = "Stock Name",
         bk_stock_id = BK_Stk,
         stock_id = StkLkUp)

usethis::use_data(bk_lookup_chin, overwrite = TRUE)




