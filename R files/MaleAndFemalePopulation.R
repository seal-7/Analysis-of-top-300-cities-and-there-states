citys=read.csv("cities_r2.csv")
library(ggplot2)
library(highcharter)
#print(names(citys))
x=data.frame(citys$population_total,citys$state_name)
states=unique(citys$state_name)
population=0
literate=0
male=0
female=0
for (i in 1:length(states)) {
  population[i]=0
  literate[i]=0
  male[i]=0
  female[i]=0
  for (j in 1:length(citys$state_name)) {
    if(identical(as.character(states[i]),as.character(citys$state_name[j]))){
      population[i]= population[i]+ as.integer(citys$population_total)
      literate[i]=literate[i]+ as.integer(citys$literates_total)
      male[i]=male[i]+as.integer(citys$population_male)
      female[i]=female[i]+as.integer(citys$population_female)
    }
  }
}

#new=data.frame(population,states)
new =data.frame(literate,states)
maleFemale=data.frame(male,female,states)
print(maleFemale)
#ggplot(x=population,y=states,data=data.frame(population,states),xlim=c(13,90))+geom_point()
#hchart(maleFemale,"bar",hcaes(x= male,y=female),name="literate")
hc <- highchart() %>% 
  hc_xAxis(categories = maleFemale$states) %>% 
  hc_add_series(name = "Male", data = maleFemale$male) %>% 
  hc_add_series(name = "Female", data = maleFemale$female) %>% 
  hc_title(text="Comparision of Male and Female Population")
print(hc)