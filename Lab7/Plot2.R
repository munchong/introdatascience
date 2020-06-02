#set wd
setwd("C:/Users/Windows 10/Documents/RStudio/Assignment8/")

library(data.table)

#get dataset
dt <- fread("./household_power_consumption 2.txt")

dt$Date <- as.Date(dt$Date, format = "%d/%m%Y")
dt

#subsetting data
dt_filter <- subset(dt,Date == "2007-02-01" | Date == "2007-02-02")
dt_filter

#Converting Date and Time together into a new column Datetime of POSIXct Class to 
#represent calender dates and times
datetime <- paste(as.Date(dt_filter$Date), dt_filter$Time)
dt_filter$Datetime <- as.POSIXct(datetime)
dt_filter

#output histogram to PNG
plot(dt_filter$Global_active_power~dt_filter$Datetime, type = "l",
     ylab = "Global Active Power(kilowatts)",xlab="")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
