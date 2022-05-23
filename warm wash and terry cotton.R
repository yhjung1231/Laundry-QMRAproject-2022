organism<-"E.coli"
source("Parameters and distributions.R")

## terry cotton, cold
#Matrix -------------------------------------------------
numevents<-8
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")

Conc.h.tc<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h.tc)<-eventsname

Conc.l.tc<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l.tc)<-eventsname

Dose.tc<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose.tc)<-eventsname

Risk.tc<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk.tc)<-eventsname

##Baseline scenario -----------------------------------------------------------------

#Event 1. Loading dirty clothes from hamper to washer

Conc.h.tc[1,]<-Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-Conc.onecloth*exp(-Inact.s*Contact.time.laundry))}
Conc.l.tc[1,]<-Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h*Contact.time.laundry))}
Dose.tc[1,]<-0
Risk.tc[1,]<-0

#Event 2. Hand to face contact #1

Conc.h.tc[2,]<-(1-TE.face*Frac.HF)*(Conc.h.tc[1,]*exp(-Inact.h*Contact.time.face.w))
Conc.l.tc[2,]<-Conc.l.tc[1,]/10^(Reduc.wash.terry*Contact.time.face.w/Dur.wash)
Dose.tc[2,]<-Conc.h.tc[1,]*exp(-Inact.h*Contact.time.face.w)*TE.face*Frac.HF*T.handarea
Risk.tc[2,]<-1-(1+(Dose.tc[2,]/beta))^(-alpha)


#Event 3. Washing Laundry 
Conc.h.tc[3,]<-Conc.h.tc[2,]*exp(-Inact.h*(Dur.wash-Contact.time.face.w))
Conc.l.tc[3,]<-Conc.l.tc[2,]/10^(Reduc.wash.terry*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose.tc[3,]<-Dose.tc[2,]
Risk.tc[3,]<-Risk.tc[2,]

#Event 4. Loading washed clothes to dryer
Conc.h.tc[4,]<-Conc.h.tc[3,]*exp(-Inact.h*Contact.time.laundry)-{TE.wet*Frac.HS*
    (Conc.h.tc[3,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.tc[3,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.tc[4,]<-Conc.l.tc[3,]*exp(-Inact.s*Contact.time.laundry)-{TE.wet*Frac.HS*T.handarea/Surface.area.laundry*
    (Conc.l.tc[3,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.tc[3,]*exp(-Inact.h*Contact.time.laundry))}
Dose.tc[4,]<-Dose.tc[3,]
Risk.tc[4,]<-Risk.tc[3,]

#Event 5. Hand to face contact #2

Conc.h.tc[5,]<-(1-TE.face*Frac.HF)*(Conc.h.tc[4,]*exp(-Inact.h*Contact.time.face.d))
Conc.l.tc[5,]<-Conc.l.tc[4,]/10^(Reduc.dry*Contact.time.face.d/Dur.dry)
Dose.tc[5,]<-Dose.tc[4,]+(Conc.h.tc[4,]*exp(-Inact.h*Contact.time.face.d)*TE.face*Frac.HF*T.handarea)
Risk.tc[5,]<- 1-(1+(Dose.tc[5,]/beta))^(-alpha)

#Event 6. Drying Laundry 
Conc.h.tc[6,]<-Conc.h.tc[5,]*exp(-Inact.h*(Dur.dry-Contact.time.face.d))
Conc.l.tc[6,]<-Conc.l.tc[5,]/10^(Reduc.dry*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose.tc[6,]<-Dose.tc[5,]
Risk.tc[6,]<-Risk.tc[5,]

#Event 7. Dryer to folding area 
Conc.h.tc[7,]<-Conc.h.tc[6,]*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*
    (Conc.h.tc[6,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.tc[6,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.tc[7,]<-Conc.l.tc[6,]*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*
    T.handarea/Surface.area.laundry*(Conc.l.tc[6,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.tc[6,]
                                     *(exp(-Inact.h*Contact.time.laundry)))}
Dose.tc[7,]<-Dose.tc[6,]
Risk.tc[7,]<-Risk.tc[6,]

#Event 8. Hand to face Contact #3

Conc.h.tc[8,]<-(1-TE.face*Frac.HF)*(Conc.h.tc[7,]*exp(-Inact.h*Contact.time.face.f))
Conc.l.tc[8,]<-Conc.l.tc[7,]*exp(-Inact.s*Contact.time.face.f)
Dose.tc[8,]<-Dose.tc[7,]+(Conc.h.tc[7,]*exp(-Inact.h*Contact.time.face.f)*TE.face*Frac.HF*T.handarea)
Risk.tc[8,]<- 1-(1+(Dose.tc[8,]/beta))^(-alpha)



## terry cotton, Warm 
#Matrix -------------------------------------------------
numevents<-8
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")

Conc.h.tw<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h.tw)<-eventsname

Conc.l.tw<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l.tw)<-eventsname

Dose.tw<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose.tw)<-eventsname

Risk.tw<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk.tw)<-eventsname

##Baseline scenario -----------------------------------------------------------------

#Event 1. Loading dirty clothes from hamper to washer

Conc.h.tw[1,]<-Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-Conc.onecloth*exp(-Inact.s*Contact.time.laundry))}
Conc.l.tw[1,]<-Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h*Contact.time.laundry))}
Dose.tw[1,]<-0
Risk.tw[1,]<-0

#Event 2. Hand to face contact #1

Conc.h.tw[2,]<-(1-TE.face*Frac.HF)*(Conc.h.tw[1,]*exp(-Inact.h*Contact.time.face.w))
Conc.l.tw[2,]<-Conc.l.tw[1,]/10^(Reduc.wash.terry.w*Contact.time.face.w/Dur.wash)
Dose.tw[2,]<-Conc.h.tw[1,]*exp(-Inact.h*Contact.time.face.w)*TE.face*Frac.HF*T.handarea
Risk.tw[2,]<-1-(1+(Dose.tw[2,]/beta))^(-alpha)


#Event 3. Washing Laundry 
Conc.h.tw[3,]<-Conc.h.tw[2,]*exp(-Inact.h*(Dur.wash-Contact.time.face.w))
Conc.l.tw[3,]<-Conc.l.tw[2,]/10^(Reduc.wash.terry.w*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose.tw[3,]<-Dose.tw[2,]
Risk.tw[3,]<-Risk.tw[2,]

#Event 4. Loading washed clothes to dryer
Conc.h.tw[4,]<-Conc.h.tw[3,]*exp(-Inact.h*Contact.time.laundry)-{TE.wet*Frac.HS*
    (Conc.h.tw[3,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.tw[3,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.tw[4,]<-Conc.l.tw[3,]*exp(-Inact.s*Contact.time.laundry)-{TE.wet*Frac.HS*T.handarea/Surface.area.laundry*
    (Conc.l.tw[3,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.tw[3,]*exp(-Inact.h*Contact.time.laundry))}
Dose.tw[4,]<-Dose.tw[3,]
Risk.tw[4,]<-Risk.tw[3,]

#Event 5. Hand to face contact #2

Conc.h.tw[5,]<-(1-TE.face*Frac.HF)*(Conc.h.tw[4,]*exp(-Inact.h*Contact.time.face.d))
Conc.l.tw[5,]<-Conc.l.tw[4,]/10^(Reduc.dry*Contact.time.face.d/Dur.dry)
Dose.tw[5,]<-Dose.tw[4,]+(Conc.h.tw[4,]*exp(-Inact.h*Contact.time.face.d)*TE.face*Frac.HF*T.handarea)
Risk.tw[5,]<- 1-(1+(Dose.tw[5,]/beta))^(-alpha)

#Event 6. Drying Laundry 
Conc.h.tw[6,]<-Conc.h.tw[5,]*exp(-Inact.h*(Dur.dry-Contact.time.face.d))
Conc.l.tw[6,]<-Conc.l.tw[5,]/10^(Reduc.dry*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose.tw[6,]<-Dose.tw[5,]
Risk.tw[6,]<-Risk.tw[5,]

#Event 7. Dryer to folding area 
Conc.h.tw[7,]<-Conc.h.tw[6,]*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*
    (Conc.h.tw[6,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.tw[6,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.tw[7,]<-Conc.l.tw[6,]*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*
    T.handarea/Surface.area.laundry*(Conc.l.tw[6,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.tw[6,]
                                     *(exp(-Inact.h*Contact.time.laundry)))}
Dose.tw[7,]<-Dose.tw[6,]
Risk.tw[7,]<-Risk.tw[6,]

#Event 8. Hand to face Contact #3

Conc.h.tw[8,]<-(1-TE.face*Frac.HF)*(Conc.h.tw[7,]*exp(-Inact.h*Contact.time.face.f))
Conc.l.tw[8,]<-Conc.l.tw[7,]*exp(-Inact.s*Contact.time.face.f)
Dose.tw[8,]<-Dose.tw[7,]+(Conc.h.tw[7,]*exp(-Inact.h*Contact.time.face.f)*TE.face*Frac.HF*T.handarea)
Risk.tw[8,]<- 1-(1+(Dose.tw[8,]/beta))^(-alpha)


##line drying option 
#Matrix -------------------------------------------------
numevents<-8
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")

Conc.h.line<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h.line)<-eventsname

Conc.l.line<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l.line)<-eventsname

Dose.line<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose.line)<-eventsname

Risk.line<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk.line)<-eventsname

##Baseline scenario -----------------------------------------------------------------

#Event 1. Loading dirty clothes from hamper to washer

Conc.h.line[1,]<-Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-Conc.onecloth*exp(-Inact.s*Contact.time.laundry))}
Conc.l.line[1,]<-Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h*Contact.time.laundry))}
Dose.line[1,]<-0
Risk.line[1,]<-0

#Event 2. Hand to face contact #1

Conc.h.line[2,]<-(1-TE.face*Frac.HF)*(Conc.h.line[1,]*exp(-Inact.h*Contact.time.face.w))
Conc.l.line[2,]<-Conc.l.line[1,]/10^(Reduc.wash*Contact.time.face.w/Dur.wash)
Dose.line[2,]<-Conc.h.line[1,]*exp(-Inact.h*Contact.time.face.w)*TE.face*Frac.HF*T.handarea
Risk.line[2,]<-1-(1+(Dose.line[2,]/beta))^(-alpha)


#Event 3. Washing Laundry 
Conc.h.line[3,]<-Conc.h.line[2,]*exp(-Inact.h*(Dur.wash-Contact.time.face.w))
Conc.l.line[3,]<-Conc.l.line[2,]/10^(Reduc.wash*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose.line[3,]<-Dose.line[2,]
Risk.line[3,]<-Risk.line[2,]

#Event 4. Loading washed clothes to dryer
Conc.h.line[4,]<-Conc.h.line[3,]*exp(-Inact.h*Contact.time.laundry)-{TE.wet*Frac.HS*
    (Conc.h.line[3,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.line[3,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.line[4,]<-Conc.l.line[3,]*exp(-Inact.s*Contact.time.laundry)-{TE.wet*Frac.HS*T.handarea/Surface.area.laundry*
    (Conc.l.line[3,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.line[3,]*exp(-Inact.h*Contact.time.laundry))}
Dose.line[4,]<-Dose.line[3,]
Risk.line[4,]<-Risk.line[3,]

#Event 5. Hand to face contact #2

Conc.h.line[5,]<-(1-TE.face*Frac.HF)*(Conc.h.line[4,]*exp(-Inact.h*Contact.time.face.d))
Conc.l.line[5,]<-Conc.l.line[4,]/10^(Reduc.dry.line*Contact.time.face.d/Dur.dry)
Dose.line[5,]<-Dose.line[4,]+(Conc.h.line[4,]*exp(-Inact.h*Contact.time.face.d)*TE.face*Frac.HF*T.handarea)
Risk.line[5,]<- 1-(1+(Dose.line[5,]/beta))^(-alpha)

#Event 6. Drying Laundry 
Conc.h.line[6,]<-Conc.h.line[5,]*exp(-Inact.h*(Dur.dry-Contact.time.face.d))
Conc.l.line[6,]<-Conc.l.line[5,]/10^(Reduc.dry.line*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose.line[6,]<-Dose.line[5,]
Risk.line[6,]<-Risk.line[5,]

#Event 7. Dryer to folding area 
Conc.h.line[7,]<-Conc.h.line[6,]*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*
    (Conc.h.line[6,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.line[6,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.line[7,]<-Conc.l.line[6,]*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*
    T.handarea/Surface.area.laundry*(Conc.l.line[6,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.line[6,]
                                     *(exp(-Inact.h*Contact.time.laundry)))}
Dose.line[7,]<-Dose.line[6,]
Risk.line[7,]<-Risk.line[6,]

#Event 8. Hand to face Contact #3

Conc.h.line[8,]<-(1-TE.face*Frac.HF)*(Conc.h.line[7,]*exp(-Inact.h*Contact.time.face.f))
Conc.l.line[8,]<-Conc.l.line[7,]*exp(-Inact.s*Contact.time.face.f)
Dose.line[8,]<-Dose.line[7,]+(Conc.h.line[7,]*exp(-Inact.h*Contact.time.face.f)*TE.face*Frac.HF*T.handarea)
Risk.line[8,]<- 1-(1+(Dose.line[8,]/beta))^(-alpha)

