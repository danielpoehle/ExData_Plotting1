library(lubridate)

setwd("C:/Users/Daniel/Documents/R/Dateien Coursera/explData")

################## 1. Read and transform dataset ####################
dataSet <- read.csv2("./household_power_consumption.txt", 
                     stringsAsFactors = F, na.strings = "?")
dataSet$Date <- dmy(dataSet$Date)

subSet <- dataSet[dataSet$Date == ymd("2007-02-01") | dataSet$Date == ymd("2007-02-02") ,]
for(i in 3:9){
  subSet[,i] <- as.numeric(subSet[,i])
}
subSet$TimeStamp <- ymd_hms(paste(subSet$Date,subSet$Time))

################## 2. Create plot ###################################

windows(width = 480, height = 480)
plot(y = subSet$Sub_metering_1, x = subSet$TimeStamp,
     ylab = "Energy sub metering",
     xlab = "",
     type="l")
lines(y = subSet$Sub_metering_2, x = subSet$TimeStamp, col = "red")
lines(y = subSet$Sub_metering_3, x = subSet$TimeStamp, col = "blue")
legend("topright", names(subSet[7:9]), col=c("black", "red", "blue"),
       cex=0.8, lty=1)

################## 3. Save plot as png ##############################

dev.copy(png, file = "plot3.png")
dev.off()
