# get and prepare data
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata_data_household_power_consumption.zip", method="curl")
unzip(zipfile = "exdata_data_household_power_consumption.zip")
a = read.table("household_power_consumption.txt",header = T, na.strings = "?", sep=";", stringsAsFactors = F)
a$dtime = paste0(a$Date, " ", a$Time)
a$dtime = strptime(a$dtime, format = "%d/%m/%Y %H:%M:%S")

# Subset: We will only be using data from the dates 2007-02-01 and 2007-02-02.
b = a[which(a$dtime >= "2007-02-01" & a$dtime < "2007-02-03"),]

# make the plot
png(filename = "plot4.png", width = 480, height=480)
par(mfrow=c(2,2))
plot(b$dtime, b$Global_active_power, xlab=NA, ylab="Global Active Power", type="l")
plot(b$dtime, b$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(b$dtime, b$Sub_metering_1, type="n", xlab=NA, ylab = "Energy sub metering")
lines(b$dtime, b$Sub_metering_1)
lines(b$dtime, b$Sub_metering_2, col="red")
lines(b$dtime, b$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty = "n")
plot(b$dtime, b$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()