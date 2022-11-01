################################################################################
# Name of file:       00_Setup_00_Packages.R
# Type of script:     R
#
# Written/run on: R version 4.1.2 (2021-11-01) -- "Bird Hippie"
# Platform: x86_64-pc-linux-gnu (64-bit)
#
# (Install and) load required packages
################################################################################

### 01 Load the required packages from the 'renv' library ----

## Install 'renv' and activate the environment, if not already
if(!require("renv")){
  install.packages("renv")
  renv::activate()
}

## Restore the 'renv' environment, replacing any packages that are already
## installed
renv::restore(rebuild = TRUE,
              repos = c("https://ppm-test.publichealthscotland.org/phs-cran/__linux__/centos7/latest"),
              clean = TRUE,
              prompt = FALSE)

## The 'curl' package is required for downloading open data
library(curl)
