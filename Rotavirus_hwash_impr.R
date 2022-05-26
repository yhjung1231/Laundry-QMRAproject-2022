organism<-"Rotavirus"
source("Parameters and distributions_hwash_impr.R")

#Matrix -------------------------------------------------
numevents<-8
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")


Conc.h<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h)<-eventsname

Conc.l<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l)<-eventsname

Dose<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose)<-eventsname

Risk<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk)<-eventsname

##Baseline scenario -----------------------------------------------------------------

#Event 1. Loading dirty clothes from hamper to washer

Conc.h[1,]<-Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-Conc.onecloth*exp(-Inact.s*Contact.time.laundry))}
Conc.l[1,]<-Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h*Contact.time.laundry))}
Dose[1,]<-0
Risk[1,]<-0

#Event 2. Hand to face contact #1

Conc.h[2,]<-(1-TE.face*Frac.HF)*(Conc.h[1,]*exp(-Inact.h*Contact.time.face.w))
Conc.l[2,]<-Conc.l[1,]/10^(Reduc.wash*Contact.time.face.w/Dur.wash)
Dose[2,]<-Conc.h[1,]*exp(-Inact.h*Contact.time.face.w)*TE.face*Frac.HF*T.handarea
Risk[2,]<-1-(1+(Dose[2,]/beta))^(-alpha)


#Event 3. Washing Laundry 
Conc.h[3,]<-Conc.h[2,]*exp(-Inact.h*(Dur.wash-Contact.time.face.w))
Conc.l[3,]<-Conc.l[2,]/10^(Reduc.wash*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose[3,]<-Dose[2,]
Risk[3,]<-Risk[2,]

#Event 4. Loading washed clothes to dryer
Conc.h[4,]<-Conc.h[3,]*exp(-Inact.h*Contact.time.laundry)-{TE.wet*Frac.HS*
    (Conc.h[3,]*exp(-Inact.h*Contact.time.laundry)-Conc.l[3,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l[4,]<-Conc.l[3,]*exp(-Inact.s*Contact.time.laundry)-{TE.wet*Frac.HS*T.handarea/Surface.area.laundry*
    (Conc.l[3,]*exp(-Inact.s*Contact.time.laundry)-Conc.h[3,]*exp(-Inact.h*Contact.time.laundry))}
Dose[4,]<-Dose[3,]
Risk[4,]<-Risk[3,]

#Event 5. Hand to face contact #2

Conc.h[5,]<-(1-TE.face*Frac.HF)*(Conc.h[4,]*exp(-Inact.h*Contact.time.face.d))
Conc.l[5,]<-Conc.l[4,]/10^(Reduc.dry*Contact.time.face.d/Dur.dry)
Dose[5,]<-Dose[4,]+(Conc.h[4,]*exp(-Inact.h*Contact.time.face.d)*TE.face*Frac.HF*T.handarea)
Risk[5,]<- 1-(1+(Dose[5,]/beta))^(-alpha)

#Event 6. Drying Laundry 
Conc.h[6,]<-Conc.h[5,]*exp(-Inact.h*(Dur.dry-Contact.time.face.d))
Conc.l[6,]<-Conc.l[5,]/10^(Reduc.dry*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose[6,]<-Dose[5,]
Risk[6,]<-Risk[5,]

#Event 7. Dryer to folding area 
Conc.h[7,]<-Conc.h[6,]*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*
    (Conc.h[6,]*exp(-Inact.h*Contact.time.laundry)-Conc.l[6,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l[7,]<-Conc.l[6,]*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*
    T.handarea/Surface.area.laundry*(Conc.l[6,]*exp(-Inact.s*Contact.time.laundry)-Conc.h[6,]
                                     *(exp(-Inact.h*Contact.time.laundry)))}
Dose[7,]<-Dose[6,]
Risk[7,]<-Risk[6,]

#Event 8. Hand to face Contact #3

Conc.h[8,]<-(1-TE.face*Frac.HF)*(Conc.h[7,]*exp(-Inact.h*Contact.time.face.f))
Conc.l[8,]<-Conc.l[7,]*exp(-Inact.s*Contact.time.face.f)
Dose[8,]<-Dose[7,]+(Conc.h[7,]*exp(-Inact.h*Contact.time.face.f)*TE.face*Frac.HF*T.handarea)
Risk[8,]<- 1-(1+(Dose[8,]/beta))^(-alpha)




##Hand washing scenario 1----------------------------------------------------

#Matrix 
numevents<-8
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")

Conc.h.1<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h.1)<-eventsname

Conc.l.1<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l.1)<-eventsname

Dose.1<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose.1)<-eventsname

Risk.1<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk.1)<-eventsname


#Event 1. Loading dirty clothes from hamper to washer

Conc.h.1[1,]<-Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-Conc.onecloth*exp(-Inact.s*Contact.time.laundry))}
Conc.l.1[1,]<-Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h*Contact.time.laundry))}
Dose.1[1,]<-0
Risk.1[1,]<-0

#Event 2. Hand washing + Hand to face contact #1

Conc.h.1[2,]<-(1-TE.face*Frac.HF)*{(Conc.h.1[1,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.w)}
Conc.l.1[2,]<-Conc.l.1[1,]/10^(Reduc.wash*Contact.time.face.w/Dur.wash)
Dose.1[2,]<-(Conc.h.1[1,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.w)*TE.face*Frac.HF*T.handarea
Risk.1[2,]<-1-(1+(Dose.1[2,]/beta))^(-alpha)


#Event 3. Washing Laundry 
Conc.h.1[3,]<-Conc.h.1[2,]*exp(-Inact.h*(Dur.wash-Contact.time.face.w))
Conc.l.1[3,]<-Conc.l.1[2,]/10^(Reduc.wash*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose.1[3,]<-Dose.1[2,]
Risk.1[3,]<-Risk.1[2,]

#Event 4. Loading washed clothes to dryer
Conc.h.1[4,]<-Conc.h.1[3,]*exp(-Inact.h*Contact.time.laundry)-{TE.wet*Frac.HS*
    (Conc.h.1[3,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.1[3,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.1[4,]<-Conc.l.1[3,]*exp(-Inact.s*Contact.time.laundry)-{TE.wet*Frac.HS*T.handarea/Surface.area.laundry*
    (Conc.l.1[3,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.1[3,]*exp(-Inact.h*Contact.time.laundry))}
Dose.1[4,]<-Dose.1[3,]
Risk.1[4,]<-Risk.1[3,]

#Event 5. Hand to face contact #2
Conc.h.1[5,]<-(1-TE.face*Frac.HF)*(Conc.h.1[4,]*exp(-Inact.h*Contact.time.face.d))
Conc.l.1[5,]<-Conc.l.1[4,]/10^(Reduc.dry*Contact.time.face.d/Dur.dry)
Dose.1[5,]<-Dose.1[4,]+(Conc.h.1[4,]*exp(-Inact.h*Contact.time.face.d)*TE.face*Frac.HF*T.handarea)
Risk.1[5,]<- 1-(1+(Dose.1[5,]/beta))^(-alpha)

#Event 6. Drying Laundry 
Conc.h.1[6,]<-Conc.h.1[5,]*exp(-Inact.h*(Dur.dry-Contact.time.face.d))
Conc.l.1[6,]<-Conc.l.1[5,]/10^(Reduc.dry*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose.1[6,]<-Dose.1[5,]
Risk.1[6,]<-Risk.1[5,]

#Event 7. Dryer to folding area 
Conc.h.1[7,]<-Conc.h.1[6,]*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.h.1[6,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.1[6,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.1[7,]<-Conc.l.1[6,]*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.l.1[6,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.1[6,]*exp(-Inact.h*Contact.time.laundry))}
Dose.1[7,]<-Dose.1[6,]
Risk.1[7,]<-Risk.1[6,]

#Event 8. Hand to face Contact #3
Conc.h.1[8,]<-(1-TE.face*Frac.HF)*(Conc.h.1[7,]*exp(-Inact.h*Contact.time.face.f))
Conc.l.1[8,]<-Conc.l.1[7,]*exp(-Inact.s*Contact.time.face.f)
Dose.1[8,]<-Dose.1[7,]+(Conc.h.1[7,]*exp(-Inact.h*Contact.time.face.f)*TE.face*Frac.HF*T.handarea)
Risk.1[8,]<- 1-(1+(Dose.1[8,]/beta))^(-alpha)




##Hand washing scenario 2----------------------------------------------------

#Matrix 
numevents<-8
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")

Conc.h.2<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h.2)<-eventsname

Conc.l.2<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l.2)<-eventsname

Dose.2<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose.2)<-eventsname

Risk.2<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk.2)<-eventsname


#Event 1. Loading dirty clothes from hamper to washer

Conc.h.2[1,]<-Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-Conc.onecloth*exp(-Inact.s*Contact.time.laundry))}
Conc.l.2[1,]<-Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h*Contact.time.laundry))}
Dose.2[1,]<-0
Risk.2[1,]<-0

#Event 2. Hand to face contact #1

Conc.h.2[2,]<-(1-TE.face*Frac.HF)*(Conc.h.2[1,]*exp(-Inact.h*Contact.time.face.w))
Conc.l.2[2,]<-Conc.l.2[1,]/10^(Reduc.wash*Contact.time.face.w/Dur.wash)
Dose.2[2,]<-Conc.h.2[1,]*exp(-Inact.h*Contact.time.face.w)*TE.face*Frac.HF*T.handarea
Risk.2[2,]<-1-(1+(Dose.2[2,]/beta))^(-alpha)


#Event 3. Washing Laundry 
Conc.h.2[3,]<-Conc.h.2[2,]*exp(-Inact.h*(Dur.wash-Contact.time.face.w))
Conc.l.2[3,]<-Conc.l.2[2,]/10^(Reduc.wash*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose.2[3,]<-Dose.2[2,]
Risk.2[3,]<-Risk.2[2,]

#Event 4. Loading washed clothes to dryer
Conc.h.2[4,]<-Conc.h.2[3,]*exp(-Inact.h*Contact.time.laundry)-{TE.wet*Frac.HS*
    (Conc.h.2[3,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.2[3,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.2[4,]<-Conc.l.2[3,]*exp(-Inact.s*Contact.time.laundry)-{TE.wet*Frac.HS*T.handarea/Surface.area.laundry*
    (Conc.l.2[3,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.2[3,]*exp(-Inact.h*Contact.time.laundry))}
Dose.2[4,]<-Dose.2[3,]
Risk.2[4,]<-Risk.2[3,]

#Event 5. Hand Washing + Hand to face contact #2

Conc.h.2[5,]<-(1-TE.face*Frac.HF)*{(Conc.h.2[4,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.d)}
Conc.l.2[5,]<-Conc.l.2[4,]/10^(Reduc.dry*Contact.time.face.d/Dur.dry)
Dose.2[5,]<-Dose.2[4,]+((Conc.h.2[4,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.d)*TE.face*Frac.HF*T.handarea)
Risk.2[5,]<- 1-(1+(Dose.2[5,]/beta))^(-alpha)

#Event 6. Drying Laundry 
Conc.h.2[6,]<-Conc.h.2[5,]*exp(-Inact.h*(Dur.dry-Contact.time.face.d))
Conc.l.2[6,]<-Conc.l.2[5,]/10^(Reduc.dry*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose.2[6,]<-Dose.2[5,]
Risk.2[6,]<-Risk.2[5,]

#Event 7. Dryer to folding area 
Conc.h.2[7,]<-Conc.h.2[6,]*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.h.2[6,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.2[6,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.2[7,]<-Conc.l.2[6,]*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.l.2[6,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.2[6,]*exp(-Inact.h*Contact.time.laundry))}
Dose.2[7,]<-Dose.2[6,]
Risk.2[7,]<-Risk.2[6,]

#Event 8. Hand to face Contact #3
Conc.h.2[8,]<-(1-TE.face*Frac.HF)*(Conc.h.2[7,]*exp(-Inact.h*Contact.time.face.f))
Conc.l.2[8,]<-Conc.l.2[7,]*exp(-Inact.s*Contact.time.face.f)
Dose.2[8,]<-Dose.2[7,]+(Conc.h.2[7,]*exp(-Inact.h*Contact.time.face.f)*TE.face*Frac.HF*T.handarea)
Risk.2[8,]<- 1-(1+(Dose.2[8,]/beta))^(-alpha)



##Hand washing scenario 3----------------------------------------------------

#Matrix 
numevents<-8
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")

Conc.h.3<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h.3)<-eventsname

Conc.l.3<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l.3)<-eventsname

Dose.3<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose.3)<-eventsname

Risk.3<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk.3)<-eventsname


#Event 1. Loading dirty clothes from hamper to washer

Conc.h.3[1,]<-Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.i.hand*exp(-Inact.h*Contact.time.laundry)-Conc.onecloth*exp(-Inact.s*Contact.time.laundry))}
Conc.l.3[1,]<-Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.i.laundry*exp(-Inact.s*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h*Contact.time.laundry))}
Dose.3[1,]<-0
Risk.3[1,]<-0

#Event 2. Hand washing + Hand to face contact #1

Conc.h.3[2,]<-(1-TE.face*Frac.HF)*{(Conc.h.3[1,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.w)}
Conc.l.3[2,]<-Conc.l.3[1,]/10^(Reduc.wash*Contact.time.face.w/Dur.wash)
Dose.3[2,]<-(Conc.h.3[1,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.w)*TE.face*Frac.HF*T.handarea
Risk.3[2,]<-1-(1+(Dose.3[2,]/beta))^(-alpha)



#Event 3. Washing Laundry 
Conc.h.3[3,]<-Conc.h.3[2,]*exp(-Inact.h*(Dur.wash-Contact.time.face.w))
Conc.l.3[3,]<-Conc.l.3[2,]/10^(Reduc.wash*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose.3[3,]<-Dose.3[2,]
Risk.3[3,]<-Risk.3[2,]

#Event 4. Loading washed clothes to dryer
Conc.h.3[4,]<-Conc.h.3[3,]*exp(-Inact.h*Contact.time.laundry)-{TE.wet*Frac.HS*
    (Conc.h.3[3,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.3[3,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.3[4,]<-Conc.l.3[3,]*exp(-Inact.s*Contact.time.laundry)-{TE.wet*Frac.HS*T.handarea/Surface.area.laundry*
    (Conc.l.3[3,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.3[3,]*exp(-Inact.h*Contact.time.laundry))}
Dose.3[4,]<-Dose.3[3,]
Risk.3[4,]<-Risk.3[3,]

#Event 5. Hand Washing + Hand to face contact #2

Conc.h.3[5,]<-(1-TE.face*Frac.HF)*{(Conc.h.3[4,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.d)}
Conc.l.3[5,]<-Conc.l.3[4,]/10^(Reduc.dry*Contact.time.face.d/Dur.dry)
Dose.3[5,]<- Dose.3[4,]+((Conc.h.3[4,]/10^Reduc.hwash)*exp(-Inact.h*Contact.time.face.d)*TE.face*Frac.HF*T.handarea)
Risk.3[5,]<- 1-(1+(Dose.3[5,]/beta))^(-alpha)

#Event 6. Drying Laundry 
Conc.h.3[6,]<-Conc.h.3[5,]*exp(-Inact.h*(Dur.dry-Contact.time.face.d))
Conc.l.3[6,]<-Conc.l.3[5,]/10^(Reduc.dry*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose.3[6,]<-Dose.3[5,]
Risk.3[6,]<-Risk.3[5,]

#Event 7. Dryer to folding area 
Conc.h.3[7,]<-Conc.h.3[6,]*exp(-Inact.h*Contact.time.laundry)-{TE.dry*Frac.HS*(Conc.h.3[6,]*exp(-Inact.h*Contact.time.laundry)-Conc.l.3[6,]*exp(-Inact.s*Contact.time.laundry))}
Conc.l.3[7,]<-Conc.l.3[6,]*exp(-Inact.s*Contact.time.laundry)-{TE.dry*Frac.HS*T.handarea/Surface.area.laundry*(Conc.l.3[6,]*exp(-Inact.s*Contact.time.laundry)-Conc.h.3[6,]*exp(-Inact.h*Contact.time.laundry))}
Dose.3[7,]<-Dose.3[6,]
Risk.3[7,]<-Risk.3[6,]

#Event 8. Hand to face Contact #3
Conc.h.3[8,]<-(1-TE.face*Frac.HF)*(Conc.h.3[7,]*exp(-Inact.h*Contact.time.face.f))
Conc.l.3[8,]<-Conc.l.3[7,]*exp(-Inact.s*Contact.time.face.f)
Dose.3[8,]<-Dose.3[7,]+(Conc.h.3[7,]*exp(-Inact.h*Contact.time.face.f)*TE.face*Frac.HF*T.handarea)
Risk.3[8,]<- 1-(1+(Dose.3[8,]/beta))^(-alpha)





