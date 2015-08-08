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

#Plot the chart to PNG file
png("plot1.png", width=480, height=480)

hist(dates$Global_active_power, col="red", xlab = "Global Activity Power (Killowatts)", main = "Global Activity Power") 

dev.off()