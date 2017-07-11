
##Read in the data file - make sure it is saved in your working directory (after extracting from the downloaded zip)
hhldpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors= FALSE)

##Convert dates to a date type
library(lubridate)

hhldpower$Date <- dmy(hhldpower$Date)

##Subset for the two days we want
subpower <- subset(hhldpower, (Date == "2007-02-01" | Date == "2007-02-02"))

##Create histogram of Global.active_power to PNG file and close device
png(filename="plot1.png",width=480,height=480)

with(subpower, hist(Global.active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

dev.off()
