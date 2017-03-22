setwd("C:/Users/zubeir/Desktop/DataScience/assignment4")
dataFile <- "household_power_consumption.txt"
dataAll <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

DATE1 <- as.Date("1/2/2007", "%d/%m/%Y")
DATE2 <- as.Date("2/2/2007", "%d/%m/%Y")

subSetData <- subset(dataAll, as.Date(dataAll$Date, "%d/%m/%Y") >= DATE1 & as.Date(dataAll$Date, "%d/%m/%Y") <= DATE2)

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()