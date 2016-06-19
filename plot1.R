# read the data
hh <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

library(dplyr)
hh_sub1 <- filter(hh, Date == '1/2/2007' | Date == '2/2/2007')

# create the plot
png(file = "plot1.png",width = 480, height = 480, units = "px") 
hist(hh1$Global_active_power, col= 'red', main = 'Global Active Power', xlab = 'Global Active Power (Kilowatts)')
dev.off() 