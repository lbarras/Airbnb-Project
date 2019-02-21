download_airbnb_files <- function(city,
                                  pathsave = TRUE,
                                  datemin = TRUE,
                                  datemax = TRUE){
  
  # Load packages
  require("magrittr")
  require("rvest")
  require("stringr")
  
  # Load functions
  source("functions/find_file_url.R")
  source("functions/download_file_url.R")
  source("functions/city_format.R")
  
  cityf <- city_format(city)
  if(isTRUE(pathsave)) pathsave <- getwd()
  newfile.path <- paste(c(pathsave, "/", 'airbnb',"_", cityf),
                        collapse = "")
  dir.create(newfile.path, showWarnings = TRUE)

  find_file_url(cityf) %>%
    download_file_url(pathsave = newfile.path,
                      cityf = cityf,
                      datemin = datemin,
                      datemax = datemax)
  return(newfile.path)
}