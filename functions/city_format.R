# This file contains the function city_format.

# This function formats a character representing a city name so as to set all lower cases
# and replace any space by a dash "-".

# NOTE: this function is used as an internal function in find_url.

######################################################################################### 

city_format <- function(city){
  # Format city name
  # Arg: 
  #   city: character string containing the name of a city.
  #
  # Returns:
  #   cityf: character string containing the formated name of a city.
  cityf <- str_to_lower(city)  %>%
    str_replace_all(" ", "-")
  return(cityf)
}



