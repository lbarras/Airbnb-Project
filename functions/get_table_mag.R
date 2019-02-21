# This file contains the function get_table_mag.

# This function extracts a table of interest according to a given city name
# from the website insideairbnb.
# It uses the package 'magrittr' to build the pipeline.

# NOTE: same funciton as to get_table_pipeR()
######################################################################################### 

get_table_mag <- function(city){
  # Extract table of interest from website insideairbnb. Uses package 'magrittr'
  # Arg: 
  #   city: character string containing the name of a city
  #
  # Returns:
  #   city.df: dataframe
  library("rvest")
  library("stringr")
  
  url <-'http://insideairbnb.com/get-the-data.html'
  
  table.node <- url %>%
    read_html() %>%
    html_nodes("table")
  
  city.node <- table.node  %>%
    html_text() %>%
    str_detect(city_name) %>%
    which()
  
  city.df <- html_table(table.node[city.node], fill = TRUE) %>%
    .[[1]]  %>%
    .[c("Date Compiled","File Name")]
  return(city.df)
}  

# tbm2 <- get_table_mag(url, "San Francisco")