
##Read in the data file - make sure it is saved in your working directory (after extracting from the downloaded zip)
hhldpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors= FALSE)

##Convert dates to a date type
library(lubridate)

hhldpower$Date <- dmy(hhldpower$Date)

##Subset for the two days we want, combine dates and times into a new field
subpower <- subset(hhldpower, (Date == "2007-02-01" | Date == "2007-02-02"))
subpower$DateTime <- as.POSIXct(paste(subpower$Date, subpower$Time), format="%Y-%m-%d %H:%M:%S")

##Create histogram of Global.active_power to PNG file and close device
png(filename="plot4.png",width=480,height=480)

##Set up a grid of 4 plots, filling rows first
par(mfrow=c(2,2))

##Create first plot
with(subpower, plot(DateTime, Global.active_power, type="l", xlab="", ylab = "Global Active Power"))
##Create second plot
with(subpower, plot(DateTime, Voltage, type="l", xlab="datetime", ylab = "Voltage"))
##Create third plot
with(subpower, plot(DateTime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(subpower, points(DateTime,Sub_metering_2, type="l", col="red"))
with(subpower, points(DateTime,Sub_metering_3, type="l", col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)
##Create fourth plot
with(subpower, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()
