#Import Library
library(highcharter)


#Read from File
Data = read.csv("cities_r2.csv")

#Declare Array 
states=unique(Data$state_name)
male06population = 0
for (i in 1:length(states)) {
  male06population[i]=0
  for (j in 1:length(Data$state_name)) {
    if(identical(as.character(states[i]),as.character(Data$state_name[j]))){
      male06population[i]=male06population[i]+as.integer(Data$X0.6_population_male[j])
      
    }
  }
}

DataObj = data.frame(states,male06population)

#Draw Graph
hc <- hchart(DataObj,"pie", hcaes(x = states, y = male06population, group = 1),name="Male 0-6 Population")



print(hc)