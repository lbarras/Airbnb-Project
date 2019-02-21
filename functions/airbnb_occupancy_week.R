airbnb_occupancy_week <- function(airbnb.data.occ.day){
  
  library(lubridate)
  
  bnb.busy.week <- tapply(airbnb.data.occ.day$busy,
                          week(airbnb.data.occ.day$date),
                          sum)
  
  bnb.empty.week <- tapply(airbnb.data.occ.day$empty,
                           week(airbnb.data.occ.day$date),
                           sum)
  
  bnb.week <- data.frame(busy = bnb.busy.week,
                         empty = bnb.empty.week)
  bnb.week$occupancy <- bnb.week$busy / (bnb.week$busy  + bnb.week$empty)
  bnb.week$week <- as.numeric(names(bnb.busy.week))
  return(bnb.week)
}