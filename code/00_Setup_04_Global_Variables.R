################################################################################
# Name of file:       00_Setup_04_Global_Variables.R
# Type of script:     R
#
# Written/run on: R version 4.1.2 (2021-11-01) -- "Bird Hippie"
# Platform: x86_64-pc-linux-gnu (64-bit)
#
# Define global variables
################################################################################

### 00 Get some generic info about the user/system ----

run_details <- get_details()

### 01 Decide on the number of cores to use ----

num_cores <- min(4, run_details$max_cores)
print(paste("This session will use", num_cores, "of", run_details$max_cores, "cores."))

### 02 Define how long k-means clustering should run for ----

kmeans_run_time <- 120.0 # 120 minutes
