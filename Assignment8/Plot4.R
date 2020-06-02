#set working directory
setwd("C:/Users/Windows 10/Documents/RStudio/Assignment8/")

library(data.table)

#Getting dataset
dt <- fread("./household_power_consumption 2.txt",na.strings="?")

dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")

#Subsetting the data
dt_filter <- subset(dt, subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(dt)

#Converting dates
datetime <- paste(as.Date(dt_filter$Date),dt_filter$Time)
dt_filter$Datetime <- as.POSIXct(datetime)

#plot the 4 graphs with legends
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
?par()
with(dt_filter,{
  plot(Global_active_power~Datetime,type="l",
       ylab="Global Active Power",xlab="")
  plot(Voltage~Datetime,type="l",
       ylab="Voltage(volt)",xlab="")
  plot(Sub_metering_1~Datetime,type="l",
       ylab="Energy sub metering",xlab="")
       lines(Sub_metering_2~Datetime,col='Red')
       lines(Sub_metering_3~Datetime,col='Blue')
       legend("topright",col=c("black","red","blue"),lty=1,lwd=2,bty="n",legend=c("Sub_metering_1",
                                                                                  "Sub_metering_2","Sub_metering_3"),cex=0.75)
  plot(Global_reactive_power~Datetime,type="l",
       ylab="Global_Reactive_Power",xlab="datetime")
})

#Saving to file
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
