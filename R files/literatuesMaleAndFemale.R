#Import Library
library(highcharter)


#Read from File
Data = read.csv("Literate Rate of States.csv")

#Stroe Name of States
states=Data[,2]

#Declare Array 
literacyRate <- as.matrix(Data[,3])
maleLiteracyRate <-  as.matrix(Data[,4])
femaleLiteracyRate <- as.matrix(Data[,5])


#Draw Graph
hc <- highchart() %>% 
  hc_xAxis(categories = states) %>% 
  hc_add_series(name = "Literacy Rate", data = as.double(literacyRate)) %>%
  hc_add_series(name = "Male Literacy Rate", data = as.double(maleLiteracyRate)) %>% 
  hc_add_series(name = "Female Literacy Rate", data = as.double(femaleLiteracyRate)) %>% 
  hc_title(text="Comparision of Male and Female Literacy rate of Each States") %>%
  hc_add_theme(hc_theme_darkunica())

#Convert into 3D
hc <- hc %>% 
  hc_chart(type = "column",
           options3d = list(enabled = TRUE, beta =10, alpha = 10))

print(hc)