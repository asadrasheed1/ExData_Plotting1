## Assignment 1 Plot 4

## installing and loading packages if not there
install.packages("sqldf");
library(sqldf);

## loading filter data from the houehold_power_consumption.txt
data <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";", colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"));

## Merging Date and Time into Date
data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S");

## staring png ploting device
png("plot4.png");

## setting up margins 
par(mar=c(4,4,1,1));

## setting up block on canvas.
par(mfrow=c(2,2))

## draw the plot
#### First Plot
plot(data$Date, data$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)");

#### Second Plot
plot(data$Date, data$Voltage, type="l", xlab="datetime",ylab="Voltage");

#### Third Plot
plot(data$Date, data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering");
lines(data$Date, data$Sub_metering_2, type="l", col="red");
lines(data$Date, data$Sub_metering_3, type="l", col="blue");

legend("topright",col=c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),pt.cex=2,cex=1, pch="_", box.lwd="0");

#### Fourth Plot
plot(data$Date, data$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power");

## closing the png device
dev.off();