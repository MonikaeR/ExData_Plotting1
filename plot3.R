library(data.table)

data <- fread(file = "household_power_consumption.txt", sep = ";", header = TRUE,
	na.strings = "?")

days <- data[Date == "1/2/2007" | Date == "2/2/2007", ]
dt <- days[, paste(Date,Time)]
datetime <- as.POSIXct(dt, format = "%d/%m/%Y %H:%M:%S")
all <- cbind(datetime, days)

png("plot3.png", width = 480, height = 480, unit = "px")
plot(all$datetime, all$Sub_metering_1, type = "n", xlab = "datetime", ylab = "energy sub metering")
points(all$datetime, all$Sub_metering_1, type = "l", col = "black")
points(all$datetime, all$Sub_metering_2, type = "l", col = "red")
points(all$datetime, all$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), lwd = c(2,2,2), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.off()