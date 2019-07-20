library(data.table)

data <- fread(file = "household_power_consumption.txt", sep = ";", header = TRUE,
	na.strings = "?")
days <- data[Date == "1/2/2007" | Date == "2/2/2007", ]
dt <- days[, paste(Date,Time)]
datetime <- as.POSIXct(dt, format = "%d/%m/%Y %H:%M:%S")
all <- cbind(datetime, days)

png("plot2.png", width = 480, height = 480, unit = "px")
plot(all$datetime, all$Global_active_power, type = "l",
	xlab = "DateTime", ylab = "Global active power (kilowatts)", col = "black")
dev.off()