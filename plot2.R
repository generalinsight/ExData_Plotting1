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
png("plot2.png", width = 480, height = 480)
plot(datetime1, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

