#Author: RPATAL
#Date: 20160305

#1. Read file
original_data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = c("?"))

#2. Filter data
filtered_data<- subset(original_data, Date=="1/2/2007" | Date=="2/2/2007", select = Date:Sub_metering_3)

#3. Generate graphic
png("plot1.png", width = 480, height = 480)
par(mfrow=c(1,1))
hist(filtered_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()