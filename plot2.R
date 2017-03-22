setwd("C:/Users/zubeir/Desktop/DataScience/assignment4")
dataFile <- "household_power_consumption.txt"
dataAll <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

DATE1 <- as.Date("1/2/2007", "%d/%m/%Y")
DATE2 <- as.Date("2/2/2007", "%d/%m/%Y")

subSetData <- subset(dataAll, as.Date(dataAll$Date, "%d/%m/%Y") >= DATE1 & as.Date(dataAll$Date, "%d/%m/%Y") <= DATE2)
 
#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()