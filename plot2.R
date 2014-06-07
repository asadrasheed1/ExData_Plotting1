## Assignment 1 Plot 2

## installing and loading packages if not there
install.packages("sqldf");
library(sqldf);

## loading filter data from the houehold_power_consumption.txt
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";", colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"));

## Merging Date and Time into Date
data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");

## staring png ploting device
png("plot2.png");

## draw the plot
plot(data$Date, data$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)");

## closing the png device
dev.off();