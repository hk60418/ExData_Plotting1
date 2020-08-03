# Fetch "household_power_consumption.txt"
source("get_data.R")

# Read data.
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Fix Date datatype.
library(lubridate)
data$Date <- dmy(data$Date)

# Subset with Date.
data <- data[which(data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d")),]

# Get the device.
png(file = "plot1.png")

# The graph.
hist(data$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close the device.
dev.off()