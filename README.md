
<!-- README.md is generated from README.Rmd. Please edit that file -->

# framrosetta

<!-- badges: start -->
<!-- badges: end -->

`framrosetta` is a data library of look up tables for translating FRAM
fisheries, stocks, and areas to other fishery data. `framrosetta` is
part of the [FRAMverse
R-Universe](https://framverse.r-universe.dev/packages).

## Installation

You can install `framrosetta` from R-Universe like so:

``` r
install.packages("framrosetta", repos = "https://framverse.r-universe.dev")
```

Otherwise, if you have Rtools and either `{devtools}` or `{pak}`
installed, you can install `framrosetta` from source code like so:

``` r
devtools::install_github("FRAMverse/framrosetta")    
```

or

``` r
pak::pkg_install("FRAMverse/framrosetta")
```

``` r
library(framrosetta)
```

## Table summaries

`framrosetta` contains the following tables for translating FRAM
fisheries, stocks, and areas to other fishery data or human readable
formats:

### `rmis_fram`

Translating between FRAM and RMIS.

``` r
knitr::kable(head(rmis_fram, 5))
```

| psc_code | fishery_id | fishery_name | gear |
|:---------|-----------:|:-------------|-----:|
| 2F 29FW  |        169 | Fraser Spt   |   40 |
| 2F 29FW  |        169 | Fraser Spt   |   41 |
| 2F 29FW  |        169 | Fraser Spt   |   42 |
| 2F 29FW  |        169 | Fraser Spt   |   43 |
| 2F 29FW  |        169 | Fraser Spt   |   44 |

### `tocas_fram`

Translating between FRAM and TOCAS.

``` r
knitr::kable(head(tocas_fram, 5))
```

| fisher_type | gear | disposition | catch_area | fishery_id | fishery_name |
|------------:|:-----|:------------|:-----------|-----------:|:-------------|
|           1 | 41   | C&SF        | 1          |         34 | A1-Ast 41    |
|           1 | 41   | COMM        | 1          |         34 | A1-Ast 41    |
|           1 | 41   | ORGN        | 1          |         34 | A1-Ast 41    |
|           1 | 41   | TEST        | 1          |         34 | A1-Ast 41    |
|           1 | 41   | TKHM        | 1          |         34 | A1-Ast 41    |

### `waft_fram`

Translating between WAFT and FRAM.

``` r
knitr::kable(head(waft_fram, 5))
```

| fisher_type | gear | disposition | catch_area | fishery_id | fishery_name |
|------------:|:-----|:------------|:-----------|-----------:|:-------------|
|           1 | 41   | C&SF        | 01         |         34 | A1-Ast 41    |
|           1 | 41   | COMM        | 01         |         34 | A1-Ast 41    |
|           1 | 41   | ORGN        | 01         |         34 | A1-Ast 41    |
|           1 | 41   | TEST        | 01         |         34 | A1-Ast 41    |
|           1 | 41   | TKHM        | 01         |         34 | A1-Ast 41    |

### `stock_chinook_fram`

Translating between Chinook stock IDs and human-readable names.

``` r
knitr::kable(head(stock_chinook_fram, 5))
```

| species | stock_version | stock_id | production_region_number | management_unit_number | stock_name | stock_long_name |
|:---|---:|---:|---:|---:|:---|:---|
| CHINOOK | 5 | 4 | 1 | 6 | M-NK Sp Hat | Marked Nooksack Spr Hatchery |
| CHINOOK | 5 | 6 | 1 | 10 | M-NK Sp Nat | Marked Nooksack Spr Natural |
| CHINOOK | 5 | 8 | 2 | 2 | M-Skag FF | Marked Skagit Summer/Fall Fing |
| CHINOOK | 5 | 10 | 2 | 6 | M-SkagFYr | Marked Skagit Summer/Fall Year |
| CHINOOK | 5 | 12 | 2 | 10 | M-SkagSpY | Marked Skagit Spring Year |

### `stock_coho_fram`

Translating between Coho stock IDs and human-readable names.

``` r
knitr::kable(head(stock_coho_fram, 5))
```

| species | stock_version | stock_id | production_region_number | management_unit_number | stock_name | stock_long_name |
|:---|---:|---:|---:|---:|:---|:---|
| COHO | 1 | 1 | 1 | 1 | U-nkskrw | Nooksack River Wild UnMarked |
| COHO | 1 | 2 | 1 | 2 | M-nkskrw | Nooksack River Wild Marked |
| COHO | 1 | 3 | 1 | 3 | U-kendlh | Kendall Creek Hatchery UnMarked |
| COHO | 1 | 4 | 1 | 4 | M-kendlh | Kendall Creek Hatchery Marked |
| COHO | 1 | 5 | 1 | 5 | U-skokmh | Skookum Creek Hatchery UnMarked |

### `fishery_chinook_fram`

Translating between Chinook fishery IDs and human-readable names.

``` r
knitr::kable(head(fishery_chinook_fram, 5))
```

| species | version_number | fishery_id | fishery_name | fishery_title     |
|:--------|---------------:|-----------:|:-------------|:------------------|
| CHINOOK |              1 |         55 | Tr 6B:9Net   | Tr Area 6B:9 Net  |
| CHINOOK |              1 |         56 | A 10 Sport   | NT Area 10 Sport  |
| CHINOOK |              1 |         57 | A 11 Sport   | NT Area 11 Sport  |
| CHINOOK |              1 |         58 | NT10:11Net   | NT Area 10:11 Net |
| CHINOOK |              1 |         59 | Tr10:11Net   | Tr Area 10:11 Net |

### `fishery_coho_fram`

Translating between Coho fishery IDs and human-readable names.

``` r
knitr::kable(head(fishery_coho_fram, 5))
```

| species | version_number | fishery_id | fishery_name | fishery_title               |
|:--------|---------------:|-----------:|:-------------|:----------------------------|
| COHO    |              1 |          1 | No Cal Trm   | No Calif Cst Terminal Catch |
| COHO    |              1 |          2 | Cn Cal Trm   | Cntrl Cal Cst Term Catch    |
| COHO    |              1 |          3 | Ft Brg Spt   | Fort Bragg Sport            |
| COHO    |              1 |          4 | Ft Brg Trl   | Fort Bragg Troll            |
| COHO    |              1 |          5 | Ca KMZ Spt   | KMZ Sport                   |

### `timestep_chinook_fram`

Translating between Chinook time-step IDs and human-readable names.

``` r
knitr::kable(head(timestep_chinook_fram, 5))
```

| species | version_number | time_step_id | time_step_name | time_step_title  |
|:--------|---------------:|-------------:|:---------------|:-----------------|
| CHINOOK |              1 |            1 | Oct-Apr        | October-April    |
| CHINOOK |              1 |            2 | May-June       | May - June       |
| CHINOOK |              1 |            3 | July-Sept      | July - September |
| CHINOOK |              1 |            4 | Oct-Apr-2      | October-April-2  |

### `timestep_coho_fram`

Translating between Coho time-step IDs and human-readable names.

``` r
knitr::kable(head(timestep_coho_fram, 5))
```

| species | version_number | time_step_id | time_step_name | time_step_title    |
|:--------|---------------:|-------------:|:---------------|:-------------------|
| COHO    |              1 |            1 | Jan-Jun        | January - June     |
| COHO    |              1 |            2 | July           | July               |
| COHO    |              1 |            3 | August         | August             |
| COHO    |              1 |            4 | Septmbr        | September          |
| COHO    |              1 |            5 | Oct-Dec        | October - December |
