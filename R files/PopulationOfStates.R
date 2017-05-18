citys=read.csv("cities_r2.csv")
library(ggplot2)
library(highcharter)
#print(names(citys))
x=data.frame(citys$population_total,citys$state_name)
states=unique(citys$state_name)
population=0
for (i in 1:length(states)) {
  population[i]=0
  for (j in 1:length(citys$state_name)) {
    if(identical(as.character(states[i]),as.character(citys$state_name[j])))
      population[i]= population[i]+ as.integer(citys$population_total)
  }
}

new=data.frame(population,states)
#ggplot(x=population,y=states,data=data.frame(population,states),xlim=c(13,90))+geom_point()
xyz=hchart(new,"bar",hcaes(x= states,y=population),name="population")
print(xyz)