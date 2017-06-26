library(tidyverse)

fileurl <- "household_power_consumption.txt"
data <- read.table(fileurl, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#str(data)

data1 <- data %>%
        filter(Date %in% c("1/2/2007", "2/2/2007"))

str(data1)

globalActivePower <- as.numeric(data1$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
