#to set working directory
setwd("C:/Users/Windows 10/Documents/RStudio/Assignment8/")

#load library data.table
library(data.table)

#To read from text file
dt <- fread("./household_power_consumption 2.txt")

#set date as D:M:Y

dt$strDate <- as.Date(dt$Date, "%d/%m/%Y")
dt
str(dt)

#select data
dt.filter <- dt[dt$strDate == "2007-02-01"|dt$strDate == "2007-02-02"]
dt.filter$Global_active_power <- as.numeric(dt.filter$Global_active_power)

#Remove object
rm(dt)

#output histogram to PNG
png(filename = "plot1.png", width = 480, height = 480)
hist(dt.filter$Global_active_power,
     col="red",
     xlab="Global Active Power(kilowatts)",
     main="Global Active Power")
dev.off()
