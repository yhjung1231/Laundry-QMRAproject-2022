#Conc.h
matrix.Conc.h<-matrix(nrow=8, ncol=4)
colnames(matrix.Conc.h)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Conc.h)<-c(1:8)


for (f in 1:8){
    matrix.Conc.h[f,1]<-mean(Conc.h[f,])
    matrix.Conc.h[f,2]<-sd(Conc.h[f,])
    matrix.Conc.h[f,3]<-min(Conc.h[f,])
    matrix.Conc.h[f,4]<-max(Conc.h[f,])
}

#Conc.l
matrix.Conc.l<-matrix(nrow=8, ncol=4)
colnames(matrix.Conc.l)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Conc.l)<-c(1:8)


for (f in 1:8){
    matrix.Conc.l[f,1]<-mean(Conc.l[f,])
    matrix.Conc.l[f,2]<-sd(Conc.l[f,])
    matrix.Conc.l[f,3]<-min(Conc.l[f,])
    matrix.Conc.l[f,4]<-max(Conc.l[f,])
}

#Dose
matrix.Dose<-matrix(nrow=8, ncol=4)
colnames(matrix.Dose)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Dose)<-c(1:8)

for (f in 1:8){
    matrix.Dose[f,1]<-mean(Dose[f,])
    matrix.Dose[f,2]<-sd(Dose[f,])
    matrix.Dose[f,3]<-min(Dose[f,])
    matrix.Dose[f,4]<-max(Dose[f,])
}

#Risk 
matrix.Risk<-matrix(nrow=8, ncol=4)
colnames(matrix.Risk)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Risk)<-c(1:8)

for (f in 1:8){
  matrix.Risk[f,1]<-mean(Risk[f,])
  matrix.Risk[f,2]<-sd(Risk[f,])
  matrix.Risk[f,3]<-min(Risk[f,])
  matrix.Risk[f,4]<-max(Risk[f,])
}


# Risk result by handwashing scenarios 
#Risk, handwashing scenario 1 
matrix.Risk.1<-matrix(nrow=8, ncol=4)
colnames(matrix.Risk.1)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Risk.1)<-c(1:8)

for (f in 1:8){
  matrix.Risk.1[f,1]<-mean(Risk.1[f,])
  matrix.Risk.1[f,2]<-sd(Risk.1[f,])
  matrix.Risk.1[f,3]<-min(Risk.1[f,])
  matrix.Risk.1[f,4]<-max(Risk.1[f,])
}

#Risk, handwashing scenario 2 
matrix.Risk.2<-matrix(nrow=8, ncol=4)
colnames(matrix.Risk.2)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Risk.2)<-c(1:8)

for (f in 1:8){
  matrix.Risk.2[f,1]<-mean(Risk.2[f,])
  matrix.Risk.2[f,2]<-sd(Risk.2[f,])
  matrix.Risk.2[f,3]<-min(Risk.2[f,])
  matrix.Risk.2[f,4]<-max(Risk.2[f,])
}

#Risk, handwashing scenario 3 
matrix.Risk.3<-matrix(nrow=8, ncol=4)
colnames(matrix.Risk.3)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Risk.3)<-c(1:8)

for (f in 1:8){
  matrix.Risk.3[f,1]<-mean(Risk.3[f,])
  matrix.Risk.3[f,2]<-sd(Risk.3[f,])
  matrix.Risk.3[f,3]<-min(Risk.3[f,])
  matrix.Risk.3[f,4]<-max(Risk.3[f,])
}

#Pull out the data 
library(openxlsx)
write.xlsx(matrix.Conc.h, sheetName="Conc.h", file="Conc.h.rota.xlsx")
write.xlsx(matrix.Conc.l, sheetName="Conc.l", file="Conc.l.rota.xlsx")
write.xlsx(matrix.Dose, sheetName="Dose", file="Dose.rota.xlsx")
write.xlsx(matrix.Risk, sheetName="Risk", file="Risk.rota.xlsx")
write.xlsx(matrix.Risk.1, sheetName="Risk.1", file="Risk.1.rota.xlsx")
write.xlsx(matrix.Risk.2, sheetName="Risk.2", file="Risk.2.rota.xlsx")
write.xlsx(matrix.Risk.3, sheetName="Risk.3", file="Risk.3.rota.xlsx")

#Check the data 
View(matrix.Conc.h)
View(matrix.Conc.l)
View(matrix.Dose)
View(matrix.Risk)
View(matrix.Risk.1)
View(matrix.Risk.2)
View(matrix.Risk.3)
