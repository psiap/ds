library("psych")# описательные статистики
library("lmtest") # тестирование гипотез в линейных моделях
library("ggplot2")# графики
library("dplyr") # манипуляции с данными
library ("MASS") # подгонка распределений

library(datasets)
data(airquality)

str(airquality)
#уравнение парной линейной регрессии  
d <- airquality
model <- lm(data=d, Ozone~Solar.R)

nd <- data.frame(Solar.R=35,Wind = 8,3,Temp = 80)
predict(model,nd)
pairs(d, panel =  panel.smooth)






