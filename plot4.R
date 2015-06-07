
#### read the data file

house_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

### Subset data for date
new_data <- house_data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##### Subset data for time and convert date time format
datetime <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

###### define global active power and sub-metering group

globalActivePower <- as.numeric(new_data$Global_active_power)

subMetering1 <- as.numeric(new_data$Sub_metering_1)

subMetering2 <- as.numeric(new_data$Sub_metering_2)

subMetering3 <- as.numeric(new_data$Sub_metering_3)

### plot global active power, voltage , and sub metering
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()