open_airbnb_data <- function(newfile.path,
                             dateminfile = TRUE,
                             datemaxfile = TRUE,
                             start.date = TRUE,
                             last.date){
  
  source("functions/filter_url_date.R")
  
  pathfilenames <- list.files(newfile.path, full.names=TRUE)
  
  pathfilenames <- filter_url_date(pathfilenames,
                          datemin = dateminfile,
                          datemax = datemaxfile)
  
  airbnb.data <- lapply(as.list(pathfilenames), 
                        FUN = function(x) read.csv(gzfile(x),
                                                   header = TRUE))
  
  # This part is not ideal.
  cut.dates <- as.Date(str_extract(pathfilenames, "\\d{4}-\\d{2}-\\d{2}"))
  if(!isTRUE(start.date)) cut.dates[1] <- as.Date(start.date)
  cut.dates[length(cut.dates) + 1] <- as.Date(last.date) + 1
  
  for (i in 1:length(airbnb.data)){
    airbnb.data[[i]] <- airbnb.data[[i]][ as.Date(airbnb.data[[i]]$date) %in% cut.dates[i]:(cut.dates[i + 1]-1), ]
  }
  
  airbnb.data <- do.call(rbind,airbnb.data)
  
  return(airbnb.data)
}