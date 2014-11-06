library(lubridate)

setwd("C:/Users/Daniel/Documents/R/Dateien Coursera/explData")

# retrieve current locale
# Sys.getlocale("LC_TIME") 

# change to english locale (on Windows)
Sys.setlocale("LC_TIME", "English")

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
par(mfcol = c(2,2))
with(subSet, {
  plot(y = Global_active_power, x = TimeStamp,
       ylab = "Global Active Power",
       xlab = "",
       type="l")
  plot(y = Sub_metering_1, x = TimeStamp,
       ylab = "Energy sub metering",
       xlab = "",
       type="l")
  lines(y = Sub_metering_2, x = TimeStamp, col = "red")
  lines(y = Sub_metering_3, x = TimeStamp, col = "blue")
  legend("topright", names(subSet[7:9]), col=c("black", "red", "blue"),
         cex=0.8, lty=1, bty = "n")
  plot(y = Voltage, x = TimeStamp,
       ylab = "Voltage",
       xlab = "datetime",
       type="l")
  plot(y = Global_reactive_power, x = TimeStamp,
       ylab = "Global_reactive_power",
       xlab = "datetime",
       type="l")
})





################## 3. Save plot as png ##############################

dev.copy(png, file = "plot4.png")
dev.off()

# change back to German locale (on Windows)
Sys.setlocale("LC_TIME", "German")
