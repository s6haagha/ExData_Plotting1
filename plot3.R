## loading the necessary packages
library(data.table)

## reading the table

elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
elec$date_time = paste(elec$Date, elec$Time)
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec <- elec[elec$Date == as.Date("2007-02-01") | elec$Date == as.Date("2007-02-02"),]

elec$date_time <- strptime(elec$date_time, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
plot(elec$date_time, elec$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(elec$date_time, elec$Sub_metering_1, col="black")
lines(elec$date_time, elec$Sub_metering_2, col="red")
lines(elec$date_time, elec$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.copy(png, file="plot3.png")
dev.off()
