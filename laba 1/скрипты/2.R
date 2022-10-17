library("psych")# описательные статистики
library("lmtest") # тестирование гипотез в линейных моделях
library("ggplot2")# графики
library("dplyr") # манипуляции с данными
library ("MASS") # подгонка распределений

library(datasets)
data(airquality)

str(airquality)
#Корреляционное поле
d <- airquality
qplot(data=d, Ozone  , Solar.R)
qplot(data=d, Ozone  , Wind)
qplot(data=d, Ozone  , Temp)
qplot(data=d, Ozone  , Month)
qplot(data=d, Ozone  , Day)







