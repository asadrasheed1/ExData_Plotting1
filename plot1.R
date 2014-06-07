## Assignment 1 Plot 1

## installing and loading packages if not there
install.packages("sqldf");
library(sqldf);

## loading filter data from the houehold_power_consumption.txt
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";", colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"));

## staring png ploting device
png("plot1.png");

## draw the plot
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)");

## closing the png device
dev.off();