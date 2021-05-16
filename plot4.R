## loading the necessary packages
library(data.table)

## reading the table

elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
elec$date_time = paste(elec$Date, elec$Time)
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec <- elec[elec$Date == as.Date("2007-02-01") | elec$Date == as.Date("2007-02-02"),]

elec$date_time <- strptime(elec$date_time, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(elec$date_time, elec$Global_active_power, ylab="Global Active Power", xlab="", type="n")
lines(elec$date_time, elec$Global_active_power)

plot(elec$date_time, elec$Voltage, ylab="Voltage", xlab="datetime", type="n")
lines(elec$date_time, elec$Voltage)

plot(elec$date_time, elec$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(elec$date_time, elec$Sub_metering_1, col="black")
lines(elec$date_time, elec$Sub_metering_2, col="red")
lines(elec$date_time, elec$Sub_metering_3, col="blue")

plot(elec$date_time, elec$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n")
lines(elec$date_time, elec$Global_reactive_power)

dev.copy(png, file="plot4.png")
dev.off()
