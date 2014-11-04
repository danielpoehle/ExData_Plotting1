library(lubridate)

setwd("C:/Users/Daniel/Documents/R/Dateien Coursera/explData")

################## 1. Read and transform dataset ####################
dataSet <- read.csv2("./household_power_consumption.txt", 
                     stringsAsFactors = F, na.strings = "?")
dataSet$Date <- dmy(dataSet$Date)
dataSet$Time <- hms(dataSet$Time)
subSet <- dataSet[dataSet$Date == ymd("2007-02-01") | dataSet$Date == ymd("2007-02-02") ,]
for(i in 3:9){
  subSet[,i] <- as.numeric(subSet[,i])
}

################## 2. Create plot ###################################

windows(width = 480, height = 480)
hist(subSet$Global_active_power, 
     col ="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")


################## 3. Save plot as png ##############################

dev.copy(png, file = "plot1.png")
dev.off()