############################################### 
#--Taller gratuito Ciencia de Datos Ecuador--#
###############################################

#¿CÓMO IMPORTAR UNA BASE DE DATOS DE EXCEL (.xlsx)
#install.packages("openxlsx") # Instalar librería
library(openxlsx) #Activar librería

datax <- openxlsx::read.xlsx(
  "https://github.com/andervcy/TALLER-GRATUITO-R/raw/main/ventas_ecuador.xlsx",
  detectDates = T)


#¿CÓMO CREAR GRÁFICOS DE FORMA SENCILLA EN R? GGPLOT BUILDER

install.packages("esquisse")


#¿CÓMO CREAR RESÚMENES DE INFORMACIÓN?

#install.packages("dplyr")
library(dplyr)

#Ventas totales por mes
v_mes <- datax %>% 
  group_by(MES) %>% 
  summarise(VENTAS=sum(VENTAS))

#Principales clientes de Ecuador
v_destino <- datax %>% 
  filter(MES=="9") %>% 
  group_by(DESTINO) %>% 
  summarise(VENTAS=sum(VENTAS)) %>% 
  arrange(desc(VENTAS))

v_destino <- v_destino[1:5,]

#Principales destinos - evolución - facet

v_destino_f <- datax %>% 
  filter(DESTINO=="ESTADOS UNIDOS" | DESTINO=="CHINA" |
           DESTINO=="INDIA" | DESTINO=="COLOMBIA") %>% 
  group_by(MES, DESTINO) %>% 
  summarise(VENTAS=sum(VENTAS)) %>% 
  arrange(desc(VENTAS))


# Mas información sobre gráficos: https://r-charts.com/es/ggplot2/
