#Import Library
library(quantmod)
library(highcharter)

#Read from File
Data = read.csv("SexRatios.csv")


#Declare Array 
sexRatio <- Data$Sex_Ratio
childSexRatio <- Data$Child_Sex_Ratio

#Draw Graph
hc <- highchart() %>% 
  hc_xAxis(categories=Data$States) %>% 
  hc_add_series(name = "Adults Sex Ratio", data = as.double(sexRatio)) %>% 
  hc_add_series(name = "Child Sex Ratio", data = as.double(childSexRatio)) %>% 
  hc_title(text="Comparision of sex ratios of States") %>%
  hc_add_theme(hc_theme_flat()) %>%

#Convert into 3D
#hc <- hc %>% 
#  hc_chart(type = "column",
#           options3d = list(enabled = TRUE, beta =10, alpha = 10))

print(hc)