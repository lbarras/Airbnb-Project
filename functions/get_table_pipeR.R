# This file contains the function get_table_pipeR.

# This function extracts a table of interest according to a given city name
# from the website insideairbnb.
# It uses the package 'pipeR' to build the pipeline.

# NOTE: same funciton as to get_table_mag()
######################################################################################### 

get_table_pipeR <- function(city){
  # Extract table of interest from website insideairbnb. Uses package 'pipeR'
  # Arg: 
  #   city: character string containing the name of a city
  #
  # Returns:
  #   city.df: dataframe
  require("pipeR")
  require("rvest")
  require("stringr")

  url <-'http://insideairbnb.com/get-the-data.html'
  
  city.table <- url %>>%
    read_html() %>>%
    html_nodes("table") %>>%
    (~temp_node) %>>%
    html_text() %>>%
    str_detect(city) %>>%
    which() %>>%
    {html_table(temp_node[.],
                fill = TRUE)} %>>%
                {.[[1]]} %>>%
                {.[c("Date Compiled","File Name")]}
  
  return(city.table)
}
