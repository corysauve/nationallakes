
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nationallakes

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

Explore U.S. EPA [National Lakes Assessment
(NLA)](https://www.epa.gov/national-aquatic-resource-surveys/nla) data
in an R (and people) friendly format. **I’m still adding indicators so
check back later for the complete data!**

Some notable differences from the raw data:

-   snake\_case column names with some name changes for clarity.
-   Formatted dates

If you’re after the *raw* data, check out the
[narsscrapr](https://github.com/corysauve/narsscrapr) package.

## Basic Usage

nationallakes contains survey data organized by *Indicator* and
`survey_year`. Available survey years include 2007, 2012, and 2017.
However, not all indicators were collected in every survey and only
partial results are currently available for 2017.

Available indicators include:

    #>  [1] "algal_toxins"           "atrazine"               "basin_landuse_metrics" 
    #>  [4] "benthic_condition"      "benthic_counts"         "benthic_metrics"       
    #>  [7] "benthic_taxa"           "buffer_landuse_metrics" "chla"                  
    #> [10] "ecoli"                  "hydrographic_profile"   "mean_do"               
    #> [13] "mean_do_condition"      "phab_data"              "phab_metrics"          
    #> [16] "phyt_counts"            "phyt_sample_info"       "phyt_taxa"             
    #> [19] "plankton_models"        "watershed_variables"

All indicator data are available when nationallakes is loaded. To access
a particular dataset, simply access it via it’s name:

``` r
library(nationallakes)

dplyr::glimpse(algal_toxins$`2017`)
#> Rows: 3,606
#> Columns: 26
#> $ publication_date <date> 2021-04-28, 2021-04-28, 2021-04-28, 2021-04-28, 2021~
#> $ uid              <dbl> 2010177, 2010177, 2010177, 2010178, 2010178, 2010178,~
#> $ site_id          <chr> "NLA17_NV-10018", "NLA17_NV-10018", "NLA17_NV-10018",~
#> $ date_col         <date> 2017-05-30, 2017-05-30, 2017-05-30, 2017-05-31, 2017~
#> $ visit_no         <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,~
#> $ sample_type      <chr> "MICX", "MICX", "MICZ", "MICX", "MICX", "MICZ", "MICX~
#> $ not_collected    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N~
#> $ lab              <chr> "EnviroScience", "EnviroScience", "EnviroScience", "E~
#> $ matrix           <chr> "WATER", "WATER", "WATER", "WATER", "WATER", "WATER",~
#> $ sam_code         <chr> "REGULAR", "REGULAR", "REGULAR", "REGULAR", "REGULAR"~
#> $ analyte          <chr> "CYLSPER", "MICX", "MICZ", "CYLSPER", "MICX", "MICZ",~
#> $ batch_id         <chr> "JC11_31JUL2017", "JX5_20JUL2017", "JZ2_NA", "JC14_31~
#> $ sample_id        <dbl> 834962, 834962, 834980, 834932, 834932, 834950, 83448~
#> $ result           <dbl> NA, NA, NA, NA, NA, NA, NA, 0.447, 0.290, 0.248, NA, ~
#> $ result_units     <chr> NA, NA, NA, NA, NA, NA, NA, "UG/L", "UG/L", "UG/L", N~
#> $ rl               <dbl> 0.10, 0.15, 0.10, 0.10, 0.15, 0.10, 0.10, 0.15, 0.10,~
#> $ mdl              <dbl> 0.05, 0.10, 0.15, 0.05, 0.10, 0.15, 0.05, 0.10, 0.15,~
#> $ absorbance       <dbl> 1.033, 1.575, 1.590, 0.962, 1.556, 1.757, 1.062, 1.00~
#> $ absorbance_units <chr> "STD. UNITS", "STD. UNITS", "STD. UNITS", "STD. UNITS~
#> $ date_received    <date> 2017-07-12, 2017-07-12, 2017-07-12, 2017-07-12, 2017~
#> $ date_analyzed    <date> 2017-07-31, 2017-07-20, NA, 2017-07-31, 2017-07-26, ~
#> $ condition_code   <chr> "ok", "ok", "ok", "ok", "ok", "ok", "ok", "ok", "ok",~
#> $ analyst          <chr> "KH", "KH", "KH", "KH", "KH", "KH", "KH", "KH", "KH",~
#> $ dilution_factor  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N~
#> $ kit_id           <chr> "JC11", "JX5", "JZ2", "JC14", "JX6", "JZ2", "JC13", "~
#> $ nars_flag        <chr> "ND", "ND", "ND", "ND", "ND", "ND", "ND", NA, NA, NA,~
```

## Installation

You can install the development version of nationallakes from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("corysauve/nationallakes")
```

## Contributing

I welcome any contributions or suggestions for improving this package!
Please open an issue to do so.

## License

The nationallakes package is licensed under the MIT License. Please see
the [LICENSE](LICENSE.md) for more details.

## Acknowledgments

The National Lakes Assessment Data (2007, 2012, 2017) data were a result
of the collective efforts of dedicated field crews, laboratory staff,
data management and quality control staff, analysts and many others from
EPA, states, tribes, federal agencies, universities, and other
organizations. Please contact <nars-hq@epa.gov> with any questions.
