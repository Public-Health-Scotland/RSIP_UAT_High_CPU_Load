################################################################################
# Name of file:       00_Setup_04_Functions.R
# Type of script:     R
#
# Written/run on: R version 4.1.2 (2021-11-01) -- "Bird Hippie"
# Platform: x86_64-pc-linux-gnu (64-bit)
#
# Define project-specific functions
################################################################################

### get_details() ----

get_details <- function(){
  list(user = Sys.getenv()[["USER"]],
       r_version = paste(version$major, version$minor, sep = "."), 
       system = version$system,
       node = Sys.info()[["nodename"]],
       max_cores = as.numeric(parallelly::availableCores()))
}

### get_memory_limit_in_bytes() ----

get_memory_limit_in_bytes <- function(pretty = FALSE){
  memory_limit_in_bytes <- as.numeric(
    system("cat /sys/fs/cgroup/memory/memory.limit_in_bytes", intern = TRUE)
  )
  
  if(pretty) memory_limit_in_bytes <- (memory_limit_in_bytes / 1024 * 1000) |> prettyunits::pretty_bytes()
  
  return(memory_limit_in_bytes)
}

### get_memory_usage_in_bytes() ----

get_memory_usage_in_bytes <- function(pretty = FALSE){
  memory_usage_in_bytes <- as.numeric(
    system("cat /sys/fs/cgroup/memory/memory.usage_in_bytes", intern = TRUE)
  )
  
  if(pretty) memory_usage_in_bytes <- (memory_usage_in_bytes / 1024 * 1000) |> prettyunits::pretty_bytes()
  
  return(memory_usage_in_bytes)
}

### get_memory_available_in_bytes() ----

get_memory_available_in_bytes <- function(pretty = FALSE){
  get_memory_available_in_bytes <- get_memory_limit_in_bytes() -  get_memory_usage_in_bytes()
  
  if(pretty) get_memory_available_in_bytes <- (get_memory_available_in_bytes / 1024 * 1000) |> prettyunits::pretty_bytes()
  
  return(get_memory_available_in_bytes)
}
