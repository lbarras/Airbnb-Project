# This file contains the function find_file_url.

# This function finds url of data of interest (files = calendar) according to the name 
# of a city on the website 'insideairbnb'.

# NOTE: this function is used as an internal function in ...

######################################################################################### 

find_file_url <- function(cityf){
  # Finds url of data of interest on website 'insideairbnb'.
  # Arg: 
  #   city: character string containing the name of a city of interest
  #
  # Returns:
  #   ref: vector of characters containing the urls of interest.

  # This function works for this website only
  url <-'http://insideairbnb.com/get-the-data.html'
  
  # Find all calendar file urls of the city of interest
  ref <- url %>%
    read_html() %>%
    html_nodes("a") %>%
    html_attr("href") %>%
    .[which(str_detect(., cityf))] %>%
    .[which(str_detect(., "calendar"))]
}


