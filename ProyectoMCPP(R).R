#Universidad del Rosario
#Metodos Computacionales para Poliicas Publicas
#Proyecto IDH VS GASTO PUBLICO
#Hernan Garcia

#Importacion de Librerias
library(tidyverse)
library(sf)
library(terra)
library(ggplot2)
library(stars)
library(mapview)

path <-"C:/Users/Hernan Rodrigo/OneDrive/Maestría/Maestria/Metodos Computacionales/Python/ProyectoMCPP"

#Importo la base de datos geograficos de los departamentos
colombia <- read_sf(paste0(path, '/MGN_DEPTOS'), layer = 'MGN_DPTO_POLITICO')


#Se importa la base de datos incial del proyecto
Base_Unificada2 <- read_excel("C:/Users/Hernan Rodrigo/OneDrive/Maestría/Maestria/Metodos Computacionales/Python/ProyectoMCPP/Base_Unificada2.xlsx")

#Filtrar Base Creando  la Base 2019
Base_Unificada2019 <- Base_Unificada2 %>% filter( año == 2019)

#Filtrar Base Creando la Base 2018
Base_Unificada2018 <- Base_Unificada2 %>% filter( año == 2018)

#Filtrar Base Creando la Base 2017
Base_Unificada2017 <- Base_Unificada2 %>% filter( año == 2017)

#Filtrar Base Creando la Base 2016
Base_Unificada2016 <- Base_Unificada2 %>% filter( año == 2016)

#Unificacion de Bases 2019
Colombia2 <- inner_join(colombia, Base_Unificada2, by = c('DPTO_CNMBR'='departamento'))


#Unificacion de Bases 2019
ColombiaGastoPer2019 <- inner_join(colombia, Base_Unificada2019, by = c('DPTO_CNMBR'='departamento'))
FiguraGastoPer2019 <- mapView(ColombiaGastoPer2019, zcol = 'Gasto_Percapita')

ColombiaIDH2019 <- inner_join(colombia, Base_Unificada2019, by = c('DPTO_CNMBR'='departamento'))
FiguraIDH2019 <- mapView(ColombiaIDH2019, zcol = 'IDH')


#Unificacion de Bases 2018
ColombiaGasto2018 <- inner_join(colombia, Base_Unificada2018, by = c('DPTO_CNMBR'='departamento'))
FiguraGastoPer2018 <- mapView(ColombiaGasto2018, zcol = 'Gasto_Percapita')

ColombiaIDH2018 <- inner_join(colombia, Base_Unificada2018, by = c('DPTO_CNMBR'='departamento'))
mapView(ColombiaIDH2018, zcol = 'IDH')

#Unificacion de Bases 2017
ColombiaGasto2017 <- inner_join(colombia, Base_Unificada2017, by = c('DPTO_CNMBR'='departamento'))
FiguraGastoPer2017 <- mapView(ColombiaGasto2017, zcol = 'Gasto_Percapita')

ColombiaIDH2017 <- inner_join(colombia, Base_Unificada2017, by = c('DPTO_CNMBR'='departamento'))
Figura2 <- mapView(ColombiaIDH2017, zcol = 'IDH')

#Unificacion de Bases 2016
ColombiaGasto2016 <- inner_join(colombia, Base_Unificada2016, by = c('DPTO_CNMBR'='departamento'))
FiguraGastoPer2016 <- mapView(ColombiaGasto2016, zcol = 'Gasto_Percapita')

ColombiaIDH2016 <- inner_join(colombia, Base_Unificada2016, by = c('DPTO_CNMBR'='departamento'))
mapView(ColombiaIDH2016, zcol = 'IDH')


# Secrea base de Estadisticas Para el GastoPercapita
Base_Unificada3_agg <- Colombia2  %>% group_by(DPTO_CNMBR) %>% summarise(total = sum(Gasto_Percapita, na.rm = T),
                                                                          media = mean(Gasto_Percapita, na.rm = T), max = max(Gasto_Percapita, na.rm = T), 
                                                                          min = min(Gasto_Percapita, na.rm = T))





Base_Unificada4_agg <- Colombia2  %>% group_by(DPTO_CNMBR) %>% summarise(total = sum(IDH, na.rm = T),
                                                                         media = mean(IDH, na.rm = T), max = max(IDH, na.rm = T), 
                                                                       min = min(IDH, na.rm = T))



 


