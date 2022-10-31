#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Name of file:       01_Test_0.R
# Type of script:     R
#
# Written/run on: R version 4.1.2 (2021-11-01) -- "Bird Hippie"
# Platform: x86_64-pc-linux-gnu (64-bit)
# 
# Test 0
# ------
# Read a variable amount of prescribing data from the open data platform
# (dependent on the amount of RAM available).  Then perform K-means clustering
# on Number of Paid Items for a set number of iterations.
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

print("This test will take approximately 2 hours to complete.")

### -- SETUP ----

#benchmark_output_path <- file.path("/conf/RSIP", run_details$user, "UAT") # folder to write csv of benchmark results to
#if(!dir.exists(benchmark_output_path)){dir.create(benchmark_output_path, recursive = TRUE)} # create output folder if needed

### -- Read prescribing open data from the CKAN open data platform ----

# Read CSV file containing URLs to several months of prescribing open data

{
  gc()
  start_time <- Sys.time()
  bm1 <- bench::mark(
    read_precribing_open_data = {
      urls <- readr::read_csv(file.path(basefiles_path, "prescribing_open_data_urls.csv"),
                              show_col_types = FALSE,
                              progress = FALSE) |>
        dplyr::filter(!is.na(URL))
      
      # Decide how many prescribing open data files to read
      num_prescribing_files_to_read <- min(nrow(urls), floor((get_memory_limit_in_bytes() / 1024 * 1000) / (512 * 1024 * 1024)))
      
      urls <- urls |>
        dplyr::slice_head(n = num_prescribing_files_to_read) |>
        dplyr::pull(URL)
      
      # Read data from URLs
      
      if(num_cores >= 2){
        set.seed(123)
        future::plan(future::multisession(workers = num_cores))
        
        data <- urls |>
          furrr::future_map_dfr(readr::read_csv, show_col_types = FALSE, .options = furrr_options(seed = TRUE))
        
        future::plan(sequential)
      } else{
        data <- readr::read_csv(urls, show_col_types = FALSE, progress = FALSE)
      }
    },
    iterations = 1,
    check = FALSE
  )
  stop_time <- Sys.time()
}

### -- Output 1 ----

output_1 <- as.data.frame(run_details) |> 
  tibble::as_tibble() |>
  dplyr::select(-max_cores) |>
  dplyr::mutate(num_cores = num_cores,
                start_time = start_time,
                stop_time = stop_time,
                activity = "Reading Data") |>
  dplyr::bind_cols(bm1 |> dplyr::select(min, median, `itr/sec`, mem_alloc, `gc/sec`, n_itr, n_gc, total_time))

### -- K-means clustering ----

# Select a column containing numeric data
kmeans_data <- data |>
  dplyr::pull(NumberOfPaidItems)
rm(data)
gc()

# Define cluster centres
centres <- seq(2, 5)

# Set number of iterations
# This is based on wanting the session to run for at least 2 hours
n_iterations = 28

# Run K-means clustering repeatedly
{
  gc()
  start_time <- Sys.time()
  bm2 <- bench::mark(
    if(num_cores >= 2){
      set.seed(123)
      future::plan(future::multisession(workers = num_cores))
        
      results <- future.apply::future_lapply(
        centres,
        function(x) kmeans(kmeans_data, centers = x, nstart = 30),
        future.seed = TRUE
      )
        
      future::plan(sequential)
    } else{
      results <- lapply(centres, function(x) kmeans(kmeans_data, centers = x, nstart = 30))
    },
    iterations = n_iterations,
    check = FALSE)
  stop_time <- Sys.time()
}

### -- Output 2 ----

output_2 <- as.data.frame(run_details) |> 
  tibble::as_tibble() |>
  dplyr::select(-max_cores) |>
  dplyr::mutate(num_cores = num_cores,
                start_time = start_time,
                stop_time = stop_time,
                activity = "K-means Clustering") |>
  dplyr::bind_cols(bm2 |> dplyr::select(min, median, `itr/sec`, mem_alloc, `gc/sec`, n_itr, n_gc, total_time))

output <- dplyr::bind_rows(output_1, output_2)

# Write to file

#output_file <- file.path(benchmark_output_path, paste0("01_Test_0 ", stringr::str_replace_all(Sys.time(), ":", ""), ".csv"))
#readr::write_csv(output, file = output_file, append = file.exists(output_file))

#print(paste("The results of this test have been saved to", output_file))

### -- Thank user and close session ----

print("This test has completed. The RStudio Workbench session will now close.")
quit(save = "no")
