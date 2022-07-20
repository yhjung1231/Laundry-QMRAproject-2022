library(readr)
baseline_scenario_result_graph <- read_csv("baseline scenario result graph.csv")
View(baseline_scenario_result_graph)

library(readr)
baseline_dose <- read_csv("baseline_dose.csv")
View(baseline_dose)

require(ggplot2)
require(ggpubr)
ggplot(baseline_scenario_result_graph)+
  geom_point(aes(x=Event, y=Mean, group=Organisms, color=Organisms))+
  geom_errorbar(aes(x=Event, ymin=Mean-Sd, ymax=Mean+Sd, group=Organisms, color=Organisms))+
  facet_wrap(~Type,scales="free")+
  scale_y_continuous(trans="log10")


A<-ggplot(baseline_scenario_result_graph)+ 
  geom_point(aes(x=Event, y=Mean, group=Organisms, color=Organisms))+
  geom_ribbon(aes(x=Event, ymin=Mean-Sd, ymax=Mean+Sd, group=Organisms, fill=Organisms), alpha=0.3)+
  facet_wrap(~Organisms,scales="free")+
  theme_bw()+
  scale_y_continuous(name="Risk")
 


B<-ggplot(baseline_dose)+ 
  geom_point(aes(x=Event, y=Mean, group=Organisms, color=Organisms))+
  geom_ribbon(aes(x=Event, ymin=Mean-Sd, ymax=Mean+Sd, group=Organisms, fill=Organisms), alpha=0.3)+
  facet_wrap(~Organisms,scales="free")+
  theme_bw()+
  scale_y_continuous(name="Dose")

ggarrange(B,A, common.legend=TRUE)+
  windows()

