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
model$coefficients
model <- lm(data=d, Ozone~Wind)
model$coefficients
model <- lm(data=d, Ozone~Temp)
model$coefficients
model <- lm(data=d, Ozone~Month)
model$coefficients
model <- lm(data=d, Ozone~Day)
model$coefficients






