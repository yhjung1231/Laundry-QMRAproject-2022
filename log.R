organism<-"SARS-CoV-2"
source("Parameters and distributions.R")

a<- mean(Viralload)
log10(a)

b<- sd(Viralload)
log10(b)

c<- mean(Conc.onecloth)
log10(c)

d<- sd (Conc.onecloth)
log10(d)

e<-mean(Conc.i.laundry)
log10(e)

f<-sd (Conc.i.laundry)
log10(f)

table.Sars <- c (a,b,c,d,e,f)
View(table.Sars)

organism <- "Rotavirus"
source("Parameters and distributions.R")
a<- mean(Conc.feces)
log10(a)

b<- sd(Conc.feces)
log10(b)

c<- mean(Conc.onecloth)
log10(c)

d<- sd (Conc.onecloth)
log10(d)

e<-mean(Conc.i.laundry)
log10(e)

f<-sd (Conc.i.laundry)
log10(f)

table.rota <- c (a,b,c,d,e,f)
View(table.rota)

organism <- "Norovirus"
source("Parameters and distributions.R")
a<- mean(Viralload)
log10(a)

b<- sd(Viralload)
log10(b)

c<- mean(Conc.onecloth)
log10(c)

d<- sd (Conc.onecloth)
log10(d)

e<-mean(Conc.i.laundry)
log10(e)

f<-sd (Conc.i.laundry)
log10(f)

table.noro <- c (a,b,c,d,e,f)
View(table.noro)

organism <- "Salmonella"
source("Parameters and distributions.R")
a<- mean(Conc.feces)
log10(a)

b<- sd(Conc.feces)
log10(b)

c<- mean(Conc.onecloth)
log10(c)

d<- sd (Conc.onecloth)
log10(d)

e<-mean(Conc.i.laundry)
log10(e)

f<-sd (Conc.i.laundry)
log10(f)

table.sal <- c (a,b,c,d,e,f)
View(table.sal)

organism <- "Ecoli"
source("Parameters and distributions.R")
a<- mean(Conc.feces)
log10(a)

b<- sd(Conc.feces)
log10(b)

c<- mean(Conc.onecloth)
log10(c)

d<- sd (Conc.onecloth)
log10(d)

e<-mean(Conc.i.laundry)
log10(e)

f<-sd (Conc.i.laundry)
log10(f)

table.ecol <- c (a,b,c,d,e,f)
View(table.ecol)
