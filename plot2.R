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
plot(y = subSet$Global_active_power, x = subSet$TimeStamp,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="l")


################## 3. Save plot as png ##############################

dev.copy(png, file = "plot2.png")
dev.off()

# change back to German locale (on Windows)
Sys.setlocale("LC_TIME", "German")
