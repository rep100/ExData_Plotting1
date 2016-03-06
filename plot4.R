#Author: RPATAL
#Date: 20160305

#1. Read file
original_data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = c("?"))

#2. Filter data
filtered_data<- subset(original_data, Date=="1/2/2007" | Date=="2/2/2007", select = Date:Sub_metering_3)

#3. Transform data
final_data <- transform(filtered_data, Date=strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

#3. Generate graphics
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), oma=c(0,0,2,0), mar=c(4,4,2,1))

plot(final_data$Date, final_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(final_data$Date, final_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(final_data$Date, final_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(final_data$Date, final_data$Sub_metering_2, type = "l", col="red")
lines(final_data$Date, final_data$Sub_metering_3, type = "l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.5)

plot(final_data$Date, final_data$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "datetime")

dev.off()