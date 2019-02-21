airbnb_occupancy_day <- function(airbnb.data){

  require(plyr)
  require(magrittr)
  
  airbnb.data.long <- count(airbnb.data, c("date", "available")) %>%
    reshape(timevar = "available",
            idvar = c("date"),
            direction = "wide")
  
  colnames(airbnb.data.long) <- c("date", "busy","empty")
  
  airbnb.data.long$occupancy <- unlist(airbnb.data.long["busy"]/(airbnb.data.long["busy"] + airbnb.data.long["empty"]),
                                       use.names = FALSE)
  
  colnames(airbnb.data.long) <- c("date", "busy","empty", "occupancy")
  return(airbnb.data.long)
}