library(tidyverse)

fileurl <- "household_power_consumption.txt"
data <- read.table(fileurl, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#str(data)

data1 <- data %>%
        filter(Date %in% c("1/2/2007", "2/2/2007"))

#str(data1)

datetime <- paste(data1$Date, data1$Time, sep = " ")        

datetime1 <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data1$Global_active_power)
globalReactivePower <- as.numeric(data1$Global_reactive_power)

submtr1 <- as.numeric(data1$Sub_metering_1)
submtr2 <- as.numeric(data1$Sub_metering_2)
submtr3 <- as.numeric(data1$Sub_metering_3)

voltage <- as.numeric(data1$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime1, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(datetime1, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime1, submtr1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(datetime1, submtr2, type = "l", col = "red")
lines(datetime1, submtr3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2.5,
       col = c("black", "red", "blue"), bty = "0")

plot(datetime1, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
