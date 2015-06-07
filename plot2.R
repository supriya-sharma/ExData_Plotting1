#### read the data file

house_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

### Subset data for date
new_data <- house_data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##### Subset data for time and convert date time format
datetime <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

####### define and plot global active power in kilowatts
globalActivePower <- as.numeric(new_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

