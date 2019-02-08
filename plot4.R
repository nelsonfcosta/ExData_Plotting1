# Getting data
setwd("C:\\Users\\User\\Desktop\\exdata_data_household_power_consumption")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# ajusting data
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(as.character(data$Voltage))

data_subseted <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data_subseted["DateTime"] <- paste(as.Date(data_subseted$Date), data_subseted$Time)
data_subseted["Date.Time"] <- as.POSIXct(data_subseted$DateTime)


par(mfrow = c(2, 2), mar = c(4,4,2,1), oma = c(0,0,2,0))
#1
plot(data_subseted$Global_active_power ~ data_subseted$Date.Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")

#2
plot(data_subseted$Voltage ~ data_subseted$Date.Time, type = "l", ylab = "Voltage", xlab ="datetime")

#3
plot(data_subseted$Sub_metering_1 ~ data_subseted$Date.Time , type = "l", ylab = "Energy sub metering", xlab = "")
lines(data_subseted$Sub_metering_2 ~ data_subseted$Date.Time, col = "red")
lines(data_subseted$Sub_metering_3 ~ data_subseted$Date.Time, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty = "n", xjust = 1, yjust = 1, cex = 0.6, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(data_subseted$Global_reactive_power ~ data_subseted$Date.Time, type = "l", ylab = "Global_reactive_power", xlab ="datetime")


dev.copy(png, file = "plot4.png")
dev.off()