data <- scan('C:/Users/psiap/Desktop/учеба/Машинное обучение/laba 3/ds.csv',sep=';',what=list('character',numeric(),numeric(),numeric(),numeric(),numeric(),numeric(),numeric()))


timeVector <- as.Date.character((data[[1]]),"%d.%m.%Y")

firstdate <- c(tail(as.numeric(format(timeVector, format = "%Y")),n=1),tail(as.numeric(format(timeVector, format = "%m")),n=1))

tsdata <- data[[2]]

tsreserve <- ts(data=tsdata,start=firstdate,frequency=12)

plot(tsreserve,main="График определение силы игры 'Pokemon GO'", xlab="Дата", ylab="Сила")