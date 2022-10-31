################################################################################
# Name of file:       00_Setup_00_Packages.R
# Type of script:     R
#
# Written/run on: R version 4.1.2 (2021-11-01) -- "Bird Hippie"
# Platform: x86_64-pc-linux-gnu (64-bit)
#
# (Install and) load required packages
################################################################################

### 00 Set up 'renv' reproducible environment ----

## Ensure that the project's default CRAN repo for package installations is
## RStudio's Public Package Manager.  Add the following line (removing the
## leading "# ") to the end of the project's .Rprofile file which will ensure
## that binary packages compatible with Red Hat Enterprise Linux 7 are
## installed.  Installing binary packages is significantly faster than
## installing packages from source.

# options(repos = c(RSPM = "https://packagemanager.rstudio.com/all/__linux__/centos7/latest"))

## Installation of 'renv' only needs to happen once at the start of the project.
## Comment out this section after 'renv' has been installed and the reproducible
## environment has been initialised.

# install.packages("renv")
# renv::init()

### 01 Install the required packages into the reproducible environment ----

## Package installation only needs to occur once at the start of the project and
## whenever a new package is required.  Comment out this section once the
## required packages have been installed into the reproducible environment.

## Install packages from CRAN

#install.packages("here")
#install.packages("keyring")
#install.packages("rstudioapi")
#install.packages("tidyverse")
#install.packages("furrr")
#install.packages("future.apply")
#install.packages("parallelly")
#install.packages("bench")
#install.packages("DBI")
#install.packages("odbc")
#install.packages("rmarkdown")

## Take a 'renv' snapshot of the environment so that it can be reproduced in
## future.
#renv::snapshot()

### 02 Load the required packages from the 'renv' library ----

library(here)
library(keyring)
library(tidyverse)
library(furrr)
library(future.apply)
library(parallelly) # to accurately identify how many CPUs are available
library(bench) # to time how long parts of the script take to run
library(DBI)
library(odbc)
library(rmarkdown)
