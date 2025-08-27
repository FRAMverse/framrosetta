## pulled from framrsquared
## To avoid autocomplete ambiguity, not using more natural `filter_chinook_fishery` etc. pattern.
##
## Concerns to check:
##   are all fisheries either net or sport? Currently assumes so
##   overlap in filter_STATE
##
##   Update: have been walking through and trying separate out state filter criterion
##
##  Notes:
##    KMZ and So. Calif. fisheries are JUST california
##    Columbia river fisheries are both WA and OR
##

## Chinook

filterlist_chinook_fishery <-
  list(
    filter_sport = c(
      3, 8, 11, 13, 14, 15,
      18, 22, 27, 29, 31, 33,
      35, 48, 60, 62, 72, 36,
      42, 45, 53, 54, 56, 57,
      64, 67
    ),
    filter_net = c(2:7, 19, 23:25, 28, 37:40),
    filter_puget_sound = 36:71,
    filter_wa = c(16:29, 36:73),
    filter_bc = 4:15,
    filter_ak = 1:3,
    filter_ca = 32:34,
    filter_or = 28:33,
    filter_coast = 1:35,
    filter_commercial_wa_nt =  c(58, 65, 68, 70, 37, 39, 43, 46, 49, 51)
  )
## filter_marine is defined as not fishery_id 72 or 73 for chinook
filterlist_chinook_fishery$filter_net <- setdiff(framrosetta::fishery_chinook_fram$fishery_id,
                                                72:73)

usethis::use_data(fishery_coho_psc, overwrite = TRUE)

## Coho

filterlist_coho_fishery <-
  list(
    filter_sport = c(
      3, 5, 7, 15, 17, 19, 21, 23, 24,
      28, 29, 31, 33, 37, 40, 41, 45, 46,
      48, 49, 51, 54, 58, 59, 60, 61, 62,
      65, 66, 67, 70, 73, 76, 89, 90, 91,
      92, 93, 94, 95, 99, 100, 106, 107,
      108, 115, 116, 117, 118, 127, 129,
      135, 136, 149, 150, 151, 152, 163,
      164, 165, 166, 169, 186, 187, 188,
      189, 190, 191, 192, 193
    ),
    filter_puget_sound = 76:166,
    filter_wa = 23:166,
    filter_bc = 167:193,
    filter_ak = 194:198,
    filter_ca = 1:8,
    filter_or = 10:32,
    filter_coast = c(1:22, 33:75),
    filter_marine = c(
      3:8, 15:22, 33:50,
      79:83, 87:88, 91:93,
      96:97, 101:102, 105:107,
      109:112, 115, 118:124,
      129:133, 136:146, 152:160,
      170:198
    ),
    filter_commercial_wa_nt = c(82, 87, 96, 101, 109, 111, 119, 121, 123, 130, 132, 137, 139, 141, 143, 145, 153, 155, 157, 159)
  )
filterlist_coho_fishery$filter_net <- setdiff(framrosetta::fishery_coho_fram$fishery_id,
                                                 filterlist_coho_fishery$filter_sport)



