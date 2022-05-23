organism<-"Salmonella"
source("Parameters and distributions.R")

rDose <- 10^runif(5000, min=-3, max=7)

rDose<-runif(5000, min=10^-3, max=10^7)
risk <- 1-(1+(rDose/beta))^(-alpha)
data.test <- data.frame(risk=risk, rDose=rDose)

library (ggplot2)
ggplot(data.test, aes(x=rDose, y=risk)) +
  geom_point() +
  scale_x_continuous(trans="log10")


A <- 10^runif(10, min=0, max=3)

B <-runif(10, min=10^0, max=10^3)
data.AB<-data.frame(A=A, B=B)
data.AB_new<-as.data.frame(t(data.AB))
View(data.AB_new)

hist(A)
hist(B)
