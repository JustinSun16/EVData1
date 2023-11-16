library(ggpubr)
library(ggeasy)
library(dplyr)
library(ggplot2)
library(extrafont)
library(scales) 
library(RColorBrewer)
library(clipr)


df = read.csv(file = 'data/Electric_Vehicle_Population_Data.csv')

#Format Data
df = df %>% rename("EVtype" = "Electric.Vehicle.Type")

df = df %>% mutate(
  EVtype = recode(
    EVtype,
    'Battery Electric Vehicle (BEV)' = 'EV',
    'Plug-in Hybrid Electric Vehicle (PHEV)' = 'PHEV'
  )
)

df = df %>% mutate(
  Make = recode( 
    Make,
    'VOLKSWAGEN' = 'VW',
    'CHEVROLET' = 'CHEVY',
    'WHEEGO ELECTRIC CARS' = 'WHEEGO'
  )
)

table1 = table(df$Make)
df2 = as.data.frame(table1)
colnames(df2) <- c("Make","Units")
df2 = df2[order(df2$Units, decreasing = TRUE), ] 
write_clip(df2)
