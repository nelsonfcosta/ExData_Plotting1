# Getting data
setwd("C:\\Users\\User\\Desktop\\exdata_data_household_power_consumption")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# ajusting data
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


data_subseted <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data_subseted["DateTime"] <- paste(as.Date(data_subseted$Date), data_subseted$Time)
data_subseted["Date.Time"] <- as.POSIXct(data_subseted$DateTime)

plot(data_subseted$Sub_metering_1 ~ data_subseted$Date.Time , type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data_subseted$Sub_metering_2 ~ data_subseted$Date.Time, col = "red")
lines(data_subseted$Sub_metering_3 ~ data_subseted$Date.Time, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()