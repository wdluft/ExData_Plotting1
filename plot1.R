## R script for creating Plot 1 for the Coursera Exploratory Data Analysis course,
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

## Converts the "Date" column to date class
powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y")

## New data frame with the dates subsetted
power_consumption_subset <- powerconsumption[(powerconsumption$Date == "2007-02-01") | 
                                                   (powerconsumption$Date == "2007-02-02"),]

## Change the class of the "Global_active_power" to numeric
power_consumption_subset$Global_active_power <- as.numeric(as.character(
                                                power_consumption_subset$Global_active_power))

## Create the historgram
hist(power_consumption_subset$Global_active_power, main = paste("Global Active Power"),
      col="red", xlab="Global Active Power (kilowatts)")

## Save histogram as png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()