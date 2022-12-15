library("forecast")
library("lmtest")
library("nnet")
library("randomForest")
data <- scan('C:/Users/psiap/Desktop/учеба/Машинное обучение/laba 3/ds.csv',sep=';',what=list('character',numeric(),numeric(),numeric(),numeric(),numeric(),numeric(),numeric()))


timeVector <- as.Date.character((data[[1]]),"%d.%m.%Y")

firstdate <- c(tail(as.numeric(format(timeVector, format = "%Y")),n=1),tail(as.numeric(format(timeVector, format = "%m")),n=1))

tsdata <- data[[2]]

tsreserve <- ts(data=tsdata,start=firstdate,frequency=12)

plot(tsreserve,main="График определение силы игры 'Pokemon GO'", xlab="Дата", ylab="Сила")

plot(HoltWinters(tsreserve, beta = FALSE, gamma = FALSE),main="График определение силы игры 'Pokemon GO'", xlab="Дата", ylab="Сила")

FS.method <- function(x)
{
  n <- length(x)
  p <- q <- seq(1,by=0, length.out = n-1)
  for( i in 2:n)
  {	
    for( j in 2:i)
    {
      if(x[i]>=x[j-1]){p[i-1]<-0;}
      if(x[i]<=x[j-1]){q[i-1]<-0;}
      if(q[i-1]+p[i-1]==0){break;}
    }
  }
  t <- abs(sum(p-q)/sqrt(2*sum((1/2:n))))
  return(t);
}

FS.method(tsreserve)

MC.method<- function(x)
{
  n = length(x)
  n1 = floor(n/2)
  n2 = n - n1
  mx1 = mean(x[1:n1])
  mx2 = mean(x[(n1+1):n])
  v1 = var(x[1:n1])
  v2 = var(x[(n1+1):n])
  t = abs(mx1-mx2)/(sqrt(v1/n1)+sqrt(v2/n2))
  return(t);
}

MC.method(tsreserve)

reserve.acf <- acf(tsreserve)
reserve.acf$lag
reserve.acf$acf
plot(reserve.acf,ci.type="white")
pacf(tsreserve)


ar1<-arima.sim(list(ar=c(0.8)),n=1000)
ar2<-arima.sim(list(ar=c(0.5,-0.2)),n=1000)
par(mfcol=c(2,1))
plot(ar1,main = "График AR(1)")
plot(ar2,main = "График AR(2)")
par(mfrow=c(2,2))
acf(ar1,main="ACF модели AR(1)")
acf(ar2,main="ACF модели AR(2)")
pacf(ar1,main="PACF модели AR(1)")
pacf(ar2,main="PACF модели AR(2)")

model1 <- Arima(tsreserve,order=c(2,1,1), seasonal=list(order=c(0,1,3), period=5))
coeftest(model1)
tsdisplay(model1$residuals)
shapiro.test(model1$residuals)
fm2 <- forecast(model1)
plot(fm2)


