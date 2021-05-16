## loading the necessary packages
library(data.table)

## reading the table

elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
elec$date_time = paste(elec$Date, elec$Time)
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec <- elec[elec$Date == as.Date("2007-02-01") | elec$Date == as.Date("2007-02-02"),]

elec$date_time <- strptime(elec$date_time, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
plot(elec$date_time, elec$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n")
lines(elec$date_time, elec$Global_active_power)

dev.copy(png, file="plot2.png")
dev.off()
