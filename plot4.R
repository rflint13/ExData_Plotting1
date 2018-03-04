
## Read in file
cn <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, skip = 66637, nrows = 2880, col.names= cn)

hpc$Datetime <- strptime(paste(hpc$Date,hpc$Time),format = "%d/%m/%Y %H:%M:%S")

## Open png device
png("plot4.png", width = 480, height = 480)

## Setup 2x2 plots
par(mfcol = c(2,2))

## Top Left plot
plot(hpc$Datetime, hpc$Global_active_power, type = "l", ylab = "Global Active Power", xlab = NA)

## Bottom Left plot
plot(hpc$Datetime, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(hpc$Datetime, hpc$Sub_metering_2, type = "l", col = "red")
lines(hpc$Datetime, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright",lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

## Top Right plot
plot(hpc$Datetime, hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## Bottom Right plot
plot(hpc$Datetime, hpc$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

## Close png device
dev.off()