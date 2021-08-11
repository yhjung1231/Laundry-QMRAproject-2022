library (truncdist)

# Naming variables, vectors, matrices ------------------------------------------

#Total hand area (cm^2)
T.handarea<-runif(1000, min=445, max=535) 

#Fraction of hand surface(hand-surface, hand-face) (unitless)
Frac.HS.hamper <- runif(1000, min=0.016, max=0.25)
Frac.HS.wash <- runif(1000,min=0.13, max=0.25)
Frac.HS.fold<-runif(1000, min=0.16, max=0.25)
Frac.HF <- runif(1000, min=0.008, max=0.012) 

#Duration (min)
Dur.wash <- 50
Dur.lag <- runif(1000,min=0, max=60)
Dur.dry <- 60

#Initial concentration on hand/face
Conc.i.hand<-0
Conc.i.face<-0

#Initial concentration on laundry
Conc.i.cov2 <-1.00e7
Conc.i.rota <-1.00e11
Conc.i.sal <-1.00e10
Conc.i.nor <-1.00e11
Conc.i.ecol <-1.00e10

#Transfer efficiency_Surface to hand (hamper to washer) 
TE.dry.cov2<-rtrunc(1000,"norm", mean=0.0003, sd=0.0002, a=0, b=1)
TE.dry.rota<-rtrunc(1000,"norm", mean=0.0003, sd=0.0002, a=0, b=1)
TE.dry.sal<-rtrunc(1000, "norm", mean=0.068, sd=0.070, a=0, b=1)
TE.dry.nor<-0.1 #Place holder
TE.dry.ecol<-rtrunc(1000, "norm", mean=0.068, sd=0.070, a=0, b=1)

#Transfer efficiency_Surface to hand (washer to dryer)
TE.wet.cov2 <-0.005 
TE.wet.rota<-0.005
TE.wet.sal<-0.003
TE.wet.nor<-0.005
TE.wet.ecol<-0.003

#Transfer efficiency_Hand to face 
TE.face.cov2<-rtrunc(1000, "norm", mean=0.3390, sd=0.1318, a=0, b=1)
TE.face.rota<-rtrunc(1000, "norm", mean=0.3390, sd=0.1318, a=0, b=1)
TE.face.sal<-rtrunc(1000,"norm", mean=0.3397, sd=0.1604, a=0, b=1 )
TE.face.nor<-rtrunc(1000, "norm", mean=0.3390, sd=0.1318, a=0, b=1)
TE.face.ecol<-rtrunc(1000,"norm", mean=0.3397, sd=0.1604, a=0, b=1 )

#Wash cycle reduction (cotton, cold)
Reduc.wash.cov2 <-rtrunc(1000,"norm", mean=3.0, sd=0.02, a=0, b=5.0) #--> change wash cycle reduction & dry 

Reduc.wash.rota<-rtrunc(1000,"norm", mean=5.0, sd=0.25, a=0, b=7.0)
Reduc.wash.sal<-rtrunc(1000, "norm", mean=3.4, sd=0.39, a=0, b=5.5)
Reduc.wash.nor<-rtrunc(1000, "norm", mean=1.7, sd=0.89, a=0, b=4.0)
Reduc.wash.ecol<-rtrunc(1000, "norm", mean=3.5, sd=0.96, a=0, b=6.0)

#Dry cycle reduction(dryer)
Reduc.dry.cov2 <-rtrunc(1000, "norm", mean=3.0, sd=0.02, a=0, b=5.0) 
Reduc.dry.rota<-rtrunc(1000, "norm", mean=6.9, sd=0.06, a=0, b=9.0)
Reduc.dry.sal<-rtrunc(1000, "norm", mean=7.3, sd=0.42, a=0, b=9.5)
Reduc.dry.nor<-rtrunc(1000, "norm", mean=6.1, sd=0.10, a=0, b=8.0)
Reduc.dry.ecol<-rtrunc(1000, "norm", mean=8.0, sd=0.93, a=0, b=10.0)


#inactivation rate (decaying) on hand (/min? /sec -->use the same unit)
Inact.h.cov2 <- 0.001 #Place holder 
Inact.h.rota <- 0.001 #Place holder
Inact.h.sal <- 0.001 #Place holder
Inact.h.nor <- 0.001 #Place holder # rpb(1000, 2.84, 69.92,c=1) #rbeta()
Inact.h.ecol <-1.00e10

#inactivation rate (decaying) on laundry (cotton)
Inact.s.cov2<-0.0002
Inact.s.rota<- 0.001#Place holder
Inact.s.sal<- 0.001#Place holder
Inact.s.nor<-0.001#Place holder
Inact.s.ecol<-0.001#Place holder



#hand washing reduction 
Reduc.hwash.cov2<-3 #Place holder
Reduc.hwash.rota<-3 #Place holder
Reduc.hwash.sal<-3 #Place holder
Reduc.hwash.nor<-3 #Place holder
Reduc.hwash.ecol<-3 #Place holder

#Surface area of laundry 
surface.area.laundry<-5000 #place holder 

#Exposure modeling ------------------------------------------------------

#Matrix 
numevents<-8
iterations<-1000
eventsname<-c("Hamper to washer","Hand to face touch #1", "between face touch and end of washing cycle", 
              "Washer to dryer","Hand to face touch #2","Dry cycle","Dryer to folding area",
              "Hand to face touch #3")

Conc.h.cov2<-matrix(nrow=numevents,ncol=iterations)
rownames(Conc.h.cov2)<-eventsname

Conc.l.cov2<-matrix(nrow=numevents, ncol=iterations)
rownames(Conc.l.cov2)<-eventsname

Dose.cov2<-matrix(nrow=numevents, ncol=iterations)
rownames(Dose.cov2)<-eventsname

Risk.cov2<-matrix(nrow=numevents, ncol=iterations)
rownames(Risk.cov2)<-eventsname


#Event 1. Loading dirty clothes from hamper to washer
Contact.time.laundry<-runif(1000, min=1/60, max=10/60)

Conc.h.cov2[1,]<-Conc.i.hand*exp(-Inact.h.cov2*Contact.time.laundry)-{TE.dry.cov2*Frac.HS.hamper*(Conc.i.hand*exp(-Inact.h.cov2*Contact.time.laundry)-Conc.i.cov2*exp(-Inact.s.cov2*Contact.time.laundry))}
Conc.l.cov2[1,]<-Conc.i.cov2*exp(-Inact.s.cov2*Contact.time.laundry)-{TE.dry.cov2*Frac.HS.hamper*T.handarea/surface.area.laundry*(Conc.i.cov2*exp(-Inact.s.cov2*Contact.time.laundry)-Conc.i.hand*exp(-Inact.h.cov2*Contact.time.laundry))}
Dose.cov2[1,]<-0
Risk.cov2[1,]<-0

#Event 2. Hand washing + Hand to face contact #1
Contact.time.face.w<-runif(1000, min=1/60, max=50)

Conc.h.cov2[2,]<-Conc.h.cov2[1,]*exp(-Inact.h.cov2*Contact.time.face.w)-
  {TE.face.cov2*Frac.HF*(Conc.h.cov2[1,]*exp(-Inact.h.cov2*Contact.time.face.w))} 
#num 1 = loading laundry -> hand wash -> decaying-> face touch 
#num2 = loading laundry -> decaying on hand-> hand wash -> face touch 
Conc.h.cov2[2,]<-(1-TE.face.cov2*Frac.HF)*{(Conc.h.cov2[1,]/10^Reduc.hwash.cov2)*exp(-Inact.h.cov2*Contact.time.face.w)}
Conc.h.cov2[2,]<-(1-TE.face.cov2*Frac.HF)*{(Conc.h.cov2[1,]*exp(-Inact.h.cov2*Contact.time.face.w))/10^(Reduc.hwash.cov2)}
#I think the second one is more fit to the situation, but how do you think so?

Conc.l.cov2[2,]<-Conc.l.cov2[1,]/10^(Reduc.wash.cov2*Contact.time.face.w/Dur.wash)
Dose.cov2[2,]<-Conc.h.cov2[1,]*exp(-Inact.h.cov2*Contact.time.face.w)*TE.face.cov2*Frac.HF*T.handarea
Risk.cov2[2,]<-1-exp(-2.46E-3*Dose.cov2[2,])

#Event 3. Washing Laundry 
Conc.h.cov2[3,]<-Conc.h.cov2[2,]*exp(-Inact.h.cov2*(Dur.wash-Contact.time.face.w))
Conc.l.cov2[3,]<-Conc.h.cov2[2,]/10^(Reduc.wash.cov2*(Dur.wash-Contact.time.face.w)/Dur.wash)
Dose.cov2[3,]<-Dose.cov2[2,]
Risk.cov2[3,]<-Risk.cov2[2,]

#Event 4. Loading washed clothes to dryer
Conc.h.cov2[4,]<-Conc.h.cov2[3,]*exp(-Inact.h.cov2*Contact.time.laundry)-{TE.wet.cov2*Frac.HS.wash*
    (Conc.h.cov2[3,]*exp(-Inact.h.cov2*Contact.time.laundry)-Conc.l.cov2[3,]*exp(-Inact.s.cov2*Contact.time.laundry))}
Conc.l.cov2[4,]<-Conc.l.cov2[3,]*exp(-Inact.s.cov2*Contact.time.laundry)-{TE.wet.cov2*Frac.HS.wash*T.handarea/surface.area.laundry*
    (Conc.l.cov2[3,]*exp(-Inact.s.cov2*Contact.time.laundry)-Conc.h.cov2[3,]*exp(-Inact.h.cov2*Contact.time.laundry))}
Dose.cov2[4,]<-Dose.cov2[3,]
Risk.cov2[4,]<-Risk.cov2[3,]

#Event 5. Hand to face contact #2
Contact.time.face.d<-runif(1000, min=1/60, max=60)
#Do we need to follow up the Conc.of pathogens on face.. I just set the Conc.i.face for the calculataion 
Conc.h.cov2[5,]<-Conc.h.cov2[4,]*exp(-Inact.h.cov2*Contact.time.face.d)-{TE.face.cov2*Frac.HF*
    (Conc.h.cov2[4,]*exp(-Inact.h.cov2*Contact.time.face.d))}
Conc.h.cov2[5,]<-(1-TE.face.cov2*Frac.HF)*(Conc.h.cov2[4,]*exp(-Inact.h.cov2*Contact.time.face.w))

Conc.l.cov2[5,]<-Conc.l.cov2[4,]/10^(Reduc.dry.cov2*Contact.time.face.d/Dur.dry)
Dose.cov2[5,]<-Conc.h.cov2[4,]*exp(-Inact.h.cov2*Contact.time.face.d)*TE.face.cov2*Frac.HF*T.handarea
Risk.cov2[5,]<- 1-exp(-2.46E-3*Dose.cov2[5,])

#Event 6. Drying Laundry 
Conc.h.cov2[6,]<-Conc.h.cov2[5,]*exp(-Inact.h.cov2*(Dur.dry-Contact.time.face.d))
Conc.l.cov2[6,]<-Conc.h.cov2[5,]/10^(Reduc.wash.cov2*(Dur.dry-Contact.time.face.d)/Dur.dry)
Dose.cov2[6,]<-Dose.cov2[5,]
Risk.cov2[6,]<-Risk.cov2[5,]

#Event 7. Dryer to folding area 
Conc.h.cov2[7,]<-Conc.h.cov2[6,]*exp(-Inact.h.cov2*Contact.time.laundry)-{TE.dry.cov2*Frac.HS.fold*(Conc.h.cov2[6,]*exp(-Inact.h.cov2*Contact.time.laundry)-Conc.l.cov2[6,]*exp(-Inact.s.cov2*Contact.time.laundry))}
Conc.l.cov2[7,]<-Conc.l.cov2[6,]*exp(-Inact.s.cov2*Contact.time.laundry)-{TE.dry.cov2*Frac.HS.fold*T.handarea/surface.area.laundry*(Conc.l.cov2[6,]*exp(-Inact.s.cov2*Contact.time.laundry)-Conc.h.cov2[6,]*exp(-Inact.h.cov2*Contact.time.laundry))}
Dose.cov2[7,]<-Dose.cov2[6,]
Risk.cov2[7,]<-Risk.cov2[6,]

#Event 8. Hand to face Contact #3
Contact.time.face.f<-runif(1000, min=1/60, max=60)
Conc.h.cov2[8,]<-Conc.h.cov2[7,]*exp(-Inact.h.cov2*Contact.time.face.f)-{TE.face.cov2*Frac.HF*(Conc.h.cov2[7,]*exp(-Inact.h.cov2*Contact.time.face.f)-Conc.i.face*exp(-Inact.h.cov2*Contact.time.face.f))}             
Conc.h.cov2[8,]<-(1-TE.face.cov2*Frac.HF)*(Conc.h.cov2[7,]*exp(-Inact.h.cov2*Contact.time.face.w))

Conc.l.cov2[8,]<-Conc.l.cov2[7,]*exp(-Inact.s.cov2*Contact.time.face.f)
Dose.cov2[8,]<-Conc.h.cov2[7,]*exp(-Inact.h.cov2*Contact.time.face.f)*TE.face.cov2*Frac.HF*T.handarea
Risk.cov2[8,]<- 1-exp(-2.46E-3*Dose.cov2[8,])
