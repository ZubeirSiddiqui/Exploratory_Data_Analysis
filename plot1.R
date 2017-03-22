setwd("C:/Users/zubeir/Desktop/DataScience/assignment4")
dataFile <- "household_power_consumption.txt"
dataAll <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

DATE1 <- as.Date("1/2/2007", "%d/%m/%Y")
DATE2 <- as.Date("2/2/2007", "%d/%m/%Y")
 
subSetData <- subset(dataAll, as.Date(dataAll$Date, "%d/%m/%Y") >= DATE1 & as.Date(dataAll$Date, "%d/%m/%Y") <= DATE2)

globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()