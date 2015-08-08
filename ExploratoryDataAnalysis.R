#set Working Directory to C:\TEMP
setwd("C:\\Temp")

#Download and unzip the dataset
url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- ".\\data.zip"

download.file(url, destfile, mode = "wb") 
unzip("data.zip")

#Read the Dataset and create a Datafram
ds <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#Convert column to datatype "date" and filter to specific date
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

dates <- subset(ds, Date >= "2007-02-01" & Date <= "2007-02-02")

dates$DateTime <- paste(dates$Date, dates$Time)
dates$DateTime <- strptime(dates$DateTime, format="%Y-%m-%d %H:%M:%S")


#Plot 1 - Histogram
hist(dates$Global_active_power, col="red", xlab = "Global Activity Power (Killowatts)", main = "Global Activity Power") 

#Plot 2
plot(dates$DateTime, dates$Global_active_power, type="l", ylab="Global Activity Power (Killowatts)", xlab="")


#Plot 3
plot(dates$DateTime, dates$Sub_metering_1, type="l", ylab="Energy sub Metering", xlab="")
lines(dates$DateTime, dates$Sub_metering_2, type="l", col="red")
lines(dates$DateTime, dates$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 4
par(mfrow = c(2,2))

#Line 1 | Column 1
plot(dates$DateTime, dates$Global_active_power, type="l", ylab="Global Activity Power", xlab="")

#Line 1 | Column 2
plot(dates$DateTime, dates$Voltage, type="l", ylab="Voltage", xlab="datetime")

#Line | Column 1
plot(dates$DateTime, dates$Sub_metering_1, type="l", ylab="Energy sub Metering", xlab="")
lines(dates$DateTime, dates$Sub_metering_2, type="l", col="red")
lines(dates$DateTime, dates$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#Line 2 | Column 2
plot(dates$DateTime, dates$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")