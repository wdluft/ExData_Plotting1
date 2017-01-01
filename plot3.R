## R script for creating Plot 3 for the Coursera Exploratory Data Analysis course,
## Week 1 Peer Reviewed Project


## Download the dataset into a new directory
if(!file.exists("./exploredata")){dir.create("./exploredata")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./exploredata/projectdataset.zip")

## Unzip the dataset
unzip(zipfile = "./exploredata/projectdataset.zip", exdir = "./exploredata")

## Read table into R
powerconsumption <- read.table("./exploredata/household_power_consumption.txt", header = TRUE,
                               sep = ";", na.strings = "?")

## Subsetting necessary rows
power_consumption_subset <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

## Change class of "Date" column with strptime
date_time <- strptime(paste(power_consumption_subset$Date, power_consumption_subset$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

## Change class of variable columns to numeric
globalActivePower <- as.numeric(power_consumption_subset$Global_active_power)
subMetering1 <- as.numeric(power_consumption_subset$Sub_metering_1)
subMetering2 <- as.numeric(power_consumption_subset$Sub_metering_2)
subMetering3 <- as.numeric(power_consumption_subset$Sub_metering_3)

## Build the plot
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Save plot as a .png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()