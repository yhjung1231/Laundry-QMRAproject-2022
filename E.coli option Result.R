#Conc.l.tc
matrix.Conc.l.tc<-matrix(nrow=8, ncol=4)
colnames(matrix.Conc.l.tc)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Conc.l.tc)<-c(1:8)


for (f in 1:8){
  matrix.Conc.l.tc[f,1]<-mean(Conc.l.tc[f,])
  matrix.Conc.l.tc[f,2]<-sd(Conc.l.tc[f,])
  matrix.Conc.l.tc[f,3]<-min(Conc.l.tc[f,])
  matrix.Conc.l.tc[f,4]<-max(Conc.l.tc[f,])
}

#Conc.l.tw
matrix.Conc.l.tw<-matrix(nrow=8, ncol=4)
colnames(matrix.Conc.l.tw)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Conc.l.tw)<-c(1:8)


for (f in 1:8){
  matrix.Conc.l.tw[f,1]<-mean(Conc.l.tw[f,])
  matrix.Conc.l.tw[f,2]<-sd(Conc.l.tw[f,])
  matrix.Conc.l.tw[f,3]<-min(Conc.l.tw[f,])
  matrix.Conc.l.tw[f,4]<-max(Conc.l.tw[f,])
}


#Conc.l.line
matrix.Conc.l.line<-matrix(nrow=8, ncol=4)
colnames(matrix.Conc.l.line)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Conc.l.line)<-c(1:8)


for (f in 1:8){
  matrix.Conc.l.line[f,1]<-mean(Conc.l.line[f,])
  matrix.Conc.l.line[f,2]<-sd(Conc.l.line[f,])
  matrix.Conc.l.line[f,3]<-min(Conc.l.line[f,])
  matrix.Conc.l.line[f,4]<-max(Conc.l.line[f,])
}



#Risk terry cotton 

matrix.Risk.tc<-matrix(nrow=8, ncol=4)
colnames(matrix.Risk.tc)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Risk.tc)<-c(1:8)

for (f in 1:8){
  matrix.Risk.tc[f,1]<-mean(Risk.tc[f,])
  matrix.Risk.tc[f,2]<-sd(Risk.tc[f,])
  matrix.Risk.tc[f,3]<-min(Risk.tc[f,])
  matrix.Risk.tc[f,4]<-max(Risk.tc[f,])
}


#Risk terry cotton, warm 

matrix.Risk.tw<-matrix(nrow=8, ncol=4)
colnames(matrix.Risk.tw)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Risk.tw)<-c(1:8)

for (f in 1:8){
  matrix.Risk.tw[f,1]<-mean(Risk.tw[f,])
  matrix.Risk.tw[f,2]<-sd(Risk.tw[f,])
  matrix.Risk.tw[f,3]<-min(Risk.tw[f,])
  matrix.Risk.tw[f,4]<-max(Risk.tw[f,])
}


#Risk line drying

matrix.Risk.line<-matrix(nrow=8, ncol=4)
colnames(matrix.Risk.line)<-c('mean', 'sd', 'min', 'max')
rownames(matrix.Risk.line)<-c(1:8)

for (f in 1:8){
  matrix.Risk.line[f,1]<-mean(Risk.line[f,])
  matrix.Risk.line[f,2]<-sd(Risk.line[f,])
  matrix.Risk.line[f,3]<-min(Risk.line[f,])
  matrix.Risk.line[f,4]<-max(Risk.line[f,])
}


library(openxlsx)
write.csv(matrix.Risk.tc, file="Risk.tc.csv")
write.csv(matrix.Risk.tw,  file="Risk.tw.csv")
write.csv(matrix.Risk.line,  file="Risk.line.csv")

write.csv(matrix.Conc.l.tc,  file="Conc.l.tc.csv")
write.csv(matrix.Conc.l.tw, file="Conc.l.tw.csv")
write.csv(matrix.Conc.l.line, file="Conc.l.line.csv")


View(matrix.Conc.l.tc)
View(matrix.Conc.l.tw)
View(matrix.Conc.l.line)


View(matrix.Risk.tc)
View(matrix.Risk.tw)
View(matrix.Risk.line)
