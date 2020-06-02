#set wd
setwd("C:/Users/Windows 10/Documents/RStudio/Assignment8/")

library(data.table)

#Getting dataset
dt <- fread("./household_power_consumption 2.txt",na.strings="?")
str(dt)
dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")

#Subsetting data
dt_filter <- subset(dt, subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(dt)

#Converting dates
datetime <- paste(as.Date(dt_filter$Date),dt_filter$Time)
dt_filter$Datetime <- as.POSIXct(datetime)

#Plot the graph with different color of lines representing each sub_metering and
#with legends as well
with(dt_filter,{
  plot(Sub_metering_1~Datetime,type="l",
     ylab="Energy sub metering",xlab="")
  lines(Sub_metering_2~Datetime, col = 'Red')
  lines(Sub_metering_3~Datetime, col ='Blue')
})
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75)

#Output histogram to PNG
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
