# This file contains the function save_one_url.

# This function downloads and saves a file from a url address in the apporpriate file and
# with the appropirate file name.

# NOTE: this function is used as an internal function in download_airbnb.

######################################################################################### 

save_one_url <- function(url,
                         cityf){
  # Downloads and saves a file from one url address.
  # Arg: 
  #   url: url of file to download
  #   cityf: character string containing the formated name of a city
  #
  # Returns:
  #   -
  file.name <- str_extract(url, "\\d{4}-\\d{2}-\\d{2}")  %>%
  {paste(c(cityf, "_", ., ".csv.gz"),
         collapse = "")}
  download.file(url, file.name)
}