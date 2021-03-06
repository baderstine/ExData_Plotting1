# get and prepare data
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata_data_household_power_consumption.zip", method="curl")
unzip(zipfile = "exdata_data_household_power_consumption.zip")
a = read.table("household_power_consumption.txt",header = T, na.strings = "?", sep=";", stringsAsFactors = F)
a$dtime = paste0(a$Date, " ", a$Time)
a$dtime = strptime(a$dtime, format = "%d/%m/%Y %H:%M:%S")

# Subset: We will only be using data from the dates 2007-02-01 and 2007-02-02.
b = a[which(a$dtime >= "2007-02-01" & a$dtime < "2007-02-03"),]

# Make the plot
png(filename = "plot1.png", width = 480, height=480)
hist(b$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
