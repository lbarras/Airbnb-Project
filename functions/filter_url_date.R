# This file contains the function filter_url_date.

# This function goes throug a vector of urls and keeps only thoses which dates are
# between two chosen values.

# NOTE: this function is used as an internal function in download_airbnb.
######################################################################################### 

filter_url_date <- function(url,
                            datemin = TRUE,
                            datemax = TRUE){
  # Format city name
  # Arg: 
  #   url: vector containing url addresses.
  #   datemin: character with first date in format yyyy-mm-dd.
  #            if not specified starts at year 0.
  #   datemax: character with last date in format yyyy-mm-dd.
  #            if not specified ends at year 3000.
  # Returns:
  #   url: vector containing url addresses.
  
  # Date format on website: YYYY-MM-DD which is the standard -> all good
  all.dates <- sapply(url,
                      str_extract,
                      pattern =  "\\d{4}-\\d{2}-\\d{2}",
                      USE.NAMES = FALSE)
  all.dates <- as.Date(all.dates)
  if(isTRUE(datemin)) datemin <- min(all.dates)
  if(isTRUE(datemax)) datemax <- max(all.dates)
  url <- url[all.dates %in% as.Date(datemin): as.Date(datemax)]
  return(url)
}
