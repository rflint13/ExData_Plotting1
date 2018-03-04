
## Read in file
cn <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, skip = 66637, nrows = 2880, col.names= cn)

hpc$Datetime <- strptime(paste(hpc$Date,hpc$Time),format = "%d/%m/%Y %H:%M:%S")

## Open png device
png("plot2.png", width = 480, height = 480)

## Create line graph
plot(hpc$Datetime, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)

## Close png device
dev.off()






