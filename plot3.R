## Assignment 1 Plot 3

## installing and loading packages if not there
install.packages("sqldf");
library(sqldf);

## loading filter data from the houehold_power_consumption.txt
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";", colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"));

## Merging Date and Time into Date
data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");

## staring png ploting device
png("plot3.png");

## draw the plot
plot(data$Date, data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering");
lines(data$Date, data$Sub_metering_2, type="l", col="red");
lines(data$Date, data$Sub_metering_3, type="l", col="blue");

legend("topright",col=c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),pt.cex=2,cex=1, pch="_");

## closing the png device
dev.off();