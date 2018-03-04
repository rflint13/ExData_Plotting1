

## Read in file
cn <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, skip = 66637, nrows = 2880, col.names= cn)

hpc$Datetime <- strptime(paste(hpc$Date,hpc$Time),format = "%d/%m/%Y %H:%M:%S")

## Open png device
png("plot1.png", width = 480, height = 480)

## Create Histogram
hist(hpc$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

## Close png device
dev.off()