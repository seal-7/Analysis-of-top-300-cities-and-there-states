#Import Library
library(highcharter)


#Read from File
Data = read.csv("cities_r2.csv");
variable=as.data.frame(table(Data$state_name));

#Stroe Name of States
hc=hchart(variable,"pie", hcaes(x = Var1 , y = Freq, group = 1),name="cites")
print(hc)