download_file_url <- function(url, 
                              pathsave,
                              cityf,
                              datemin,
                              datemax){
  
  source("functions/save_one_url.R")
  source("functions/filter_url_date.R")
  
  # Save local directory
  local.dir <- getwd()
  # Set new directory where files will be saved
  setwd(pathsave)
  # Select appropriate dates
  filter_url_date(url,
                  datemin = datemin,
                  datemax = datemax)
  # Download all files
  sapply(url,
         FUN = save_one_url,
         cityf = cityf)
  # Reset initial directory
  setwd(local.dir)
}

