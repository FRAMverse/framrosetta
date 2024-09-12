
#' Generate Chinook bk_fram look-up table
#'
#' At present the FRAM databases use a differents stock_id numbering system in the BackwardsFRAM
#'  table than everywhere else. The dataframe `bk_lookup_chin` provides a lookup table based on the stocks
#'  used in Preseason 2024. However, we are working to modify FRAM to support splitting Chinook stock aggregates, which
#'  will lead to increased numbers of StockIDs. `bk_lookupfun_chin` provides an appropruate lookup table based on the `max_stock` argument, either
#'  returning `bk_lookup_chin` (if max_stock is not provided or doesn't exceed the stocks in `bk_lookup_chin`) or extending the dataframe
#'  with new stock ids based on the numbering conventions of the bk_stock_id.
#'
#' @param max_stock Positive integer representing the largest *Normal* stock id (stock ids outside of the BackwardsFram table). As of Preseason 2024, there are 78 stocks; splitting stocks might increase this (e.g. 80, 82, 84). Defaults to NA.
#'
#' @return Tibble of lookup table. `$stock_name_bk` gives numan-readable stock names; `$bk_stock_id` gives the "StockID" used
#' in backwards FRAM; `$stock_id` gives the StockID used everywhere else. NAs in `$stock_id` correspond to "totalled" stocks, which are used in
#' backwards FRAM and nowhere else.
#' @export
#'
#' @examples
#' temp = bk_lookupfun_chin(80)
#' tail(temp)

bk_lookupfun_chin <- function(max_stock = NA){
  ## input errorchecking
  if(!is.na(max_stock) & (!is.numeric(max_stock) | max_stock %% 1 != 0) ){
    cli::cli_alert("`max_stock` must be an integer.")
  }

  ## no need to do work if max_stock is not provided or is not greater than maximum in bk_lookup_chin.
  if(is.na(max_stock) | max_stock <= max(framrosetta::bk_lookup_chin$stock_id, na.rm = T)){
    return(framrosetta::bk_lookup_chin)
  }

  new.stocks = max_stock - max(framrosetta::bk_lookup_chin$stock_id, na.rm = T)
  if(new.stocks %% 2 != 0){
    cli::cli_abort("Must have even number of stocks (one for marked fish and one for unmarked fish).")
  }
  new.bk.stocks = new.stocks * 3/2
  res = framrosetta::bk_lookup_chin

  bk.cur = max(framrosetta::bk_lookup_chin$bk_stock_id, na.rm = T)+1
  stock.cur =  max(framrosetta::bk_lookup_chin$stock_id, na.rm = T)+1


  for(i in 1:new.bk.stocks){
    newrow = dplyr::case_when(
      i %% 3 == 1 ~ data.frame(stock_name_bk = "New _total_ stock (bkFRAM-only)",
                               bk_stock_id = bk.cur,
                               stock_id = NA),
      i %% 3 == 2 ~ data.frame(stock_name_bk = "New stock (presumed UnMarked)",
                               bk_stock_id = bk.cur,
                               stock_id = stock.cur),
      i %% 3 == 0 ~ data.frame(stock_name_bk = "New stock (presumed Marked)",
                               bk_stock_id = bk.cur,
                               stock_id = stock.cur)
    )
    res = rbind(res, newrow)
    ## increment counters as appropriate
    bk.cur = bk.cur+1
    if(i %% 3 != 1){ ##only increment stock_id if it was used.
      stock.cur = stock.cur + 1
    }
  }
  return(res)
}


