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
qplot(data = d, Ozone, Solar.R) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)
qplot(data = d, Ozone, Wind) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)
qplot(data = d, Ozone, Temp) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)
qplot(data = d, Ozone, Month) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)
qplot(data = d, Ozone, Day) + stat_smooth(method="lm", level = 0.95) + theme_bw(base_size = 18)






