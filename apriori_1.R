install.packages("arules")
library(arules)
install.packages("genero")
library(genero)

data = read.csv('C:/Users/kevin/OneDrive/Documentos/data.csv', sep=";")
data[,c(3,4)]
subset(data, Lab. >60)
subset(data, Lab. >60)[,c(3,4)]

data2 <- data[,c(1,2,3,4,8,9,10,11)]

regla <- apriori(data2, parameter = list(support=0.2, confidence =0.5))
inspect(regla[0:100])
inspect(regla[100:200])

