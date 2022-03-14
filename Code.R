# Creando un diagrama de puntos con ggplot
data()
library(tidyverse)
# Trabajando con BOD
BOD 
ggplot(
  data = BOD,
  mapping = aes(x=Time,
                y=demand))+
  geom_point(size=4)+
  geom_line(colour="red")
# Trabajando con la BD CO2 
View (CO2)
tail(CO2)

names(CO2)

CO2 %>% 
  ggplot(aes(conc, uptake,
             colour=Treatment))+
  geom_point(size=3, alpha=0.5)+
  geom_smooth(method = lm, se=F)+
  facet_wrap(~Type)+
  labs(title = "Concentración de CO2")+
  theme_bw()

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha=0.5, aes(size = conc,
                 color = Plant))+
  facet_wrap(~Type)+
  coord_flip()+
  theme_bw()

# Trabajando con la BD mpg

View (mpg)
mpg %>% 
  filter (cty < 25) %>% 
  ggplot(aes(displ, hwy))+
  geom_point(aes(color=drv,
                 size= trans),
             alpha=0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow=1)+
  labs(x="Cilindrada del Motor",
       y= "Rendimiento en Carretera",
       title= "Eficiencia en Consumo de Combustible")+
  theme_bw()
