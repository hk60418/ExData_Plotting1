# Fetch "household_power_consumption.txt"
source("get_data.R")

# Read data.
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Fix Date datatype.
library(lubridate)
data$Datetime <- dmy_hms(paste(data$Date, ' ', data$Time))
data$Date <- dmy(data$Date)

# Subset with Date.
data <- data[which(data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d")),]

# Get the device.
png(file = "plot4.png")

# Set the plot slots.
par(mfrow=c(2,2))
# The first plot.
plot(data$Datetime, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
# Second.
plot(data$Datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
# Third.
plot(data$Datetime, data$Sub_metering_1, type = 'l', ylim=range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)), xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type = 'l', col = "red")
lines(data$Datetime, data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", y = NULL, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1)
# Fourth.
plot(data$Datetime, data$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

# Close the device.
dev.off()