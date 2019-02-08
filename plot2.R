# Getting data
setwd("C:\\Users\\User\\Desktop\\exdata_data_household_power_consumption")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# ajusting data
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)


data_subseted <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
data_subseted["DateTime"] <- paste(as.Date(data_subseted$Date), data_subseted$Time)
data_subseted["Date.Time"] <- as.POSIXct(data_subseted$DateTime)

plot(data_subseted$Global_active_power ~ data_subseted$Date.Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")

dev.copy(png, file = "plot2.png")
dev.off()