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

data2$Nota.Final[data2$Nota.Final=="SDE"] <- -1
data2$Exam..Final[data2$Exam..Final=="SDE"] <- -1

genero("MARIO")

data2$nombre1 <-as.data.frame(do.call(rbind, strsplit(data2$Nombre.Estudiante, " ")))["V1"]
data2$nombre2 <-as.data.frame(do.call(rbind, strsplit(data2$Nombre.Estudiante, " ")))["V2"]

data2$genero <- genero(data2$nombre1$V1)

subset(data2, is.na(data2$genero))

data2$genero <- ifelse(is.na(data2$genero), genero(data2$nombre2$V2), data2$genero)

data2[55, "genero"] <- "female"
data2[77, "genero"] <- "male"

data2[113, "genero"] <- "male"
data2[119, "genero"] <- "female"
data2[120, "genero"] <- "male"
data2[122, "genero"] <- "male"
data2[130, "genero"] <- "female"
data2[179, "genero"] <- "female"
data2[185, "genero"] <- "male"
data2[202, "genero"] <- "male"
data2[225, "genero"] <- "male"
data2[250, "genero"] <- "male"
data2[276, "genero"] <- "female"
data2[360, "genero"] <- "female"
data2[363, "genero"] <- "female"
data2[417, "genero"] <- "male"
data2[431, "genero"] <- "male"
data2[473, "genero"] <- "female"
data2[487, "genero"] <- "male"

data2