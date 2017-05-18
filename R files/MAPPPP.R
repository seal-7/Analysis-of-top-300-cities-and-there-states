Data = read.csv("cities_r2.csv");
Data_Loc =read.csv("lanlog.csv");
library(leaflet)
library(dplyr)
mapIndia <- leaflet() %>% 
  addTiles('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
           attribution='designed by  SEAL_7') %>%
  setView(80, 25, zoom= 5)


MapIndia = mapIndia %>% addCircles (data=Data, lat= Data_Loc$Latitude, lng  = Data_Loc$Longitude, 
                                          popup=paste(
                                            "<strong>State : </strong>", Data$name_of_city,
                                            "<br><strong>Literacy Rate : </strong>", Data$literates_total,
                                            "<br><strong>Literacy Rate Male : </strong>", Data$effective_literacy_rate_male,
                                            "<br><strong>Literacy Rate Female : </strong>", Data$effective_literacy_rate_female,
                                            "<br><strong>Sex Ratio : </strong>", Data$sex_ratio,
                                            "<br><strong>Child Sex Ratio : </strong>", Data$child_sex_ratio, 
                                            "<br><strong>Population : </strong>", Data$population_total,
                                            "<br><strong>Male Population : </strong>", Data$population_male,
                                            "<br><strong>Female Population : </strong>", Data$population_female,
                                            "<br><strong>Latitude : </strong>", Data_Loc$Latitude,
                                            "<br><strong>Longitude : </strong>", Data_Loc$Longitude),
                                          
                                          weight = ifelse(Data$population_total <= 1000000, 4,ifelse(Data$population_total > 100000, 6, 7)), 
                                          color= ifelse(Data$population_total  <= 1000000, "dodgerblue",ifelse(Data$population_total  > 100000, "lawngreen","#FF0000")), 
                                          stroke = TRUE, fillOpacity = 0.6)


print(MapIndia)