# read the data
hh <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", 
                 na.strings = "?",stringsAsFactors = FALSE)

library(dplyr)
hh_sub <- filter(hh, Date == '1/2/2007' | Date == '2/2/2007')
# concatenate date and time
hh_sub$dtime <- paste(hh_sub$Date, hh_sub$Time)
# convert date and time character to POSIXct
hh_sub$dt <- strptime(hh_sub$dtime, "%d/%m/%Y %H:%M:%S")

# create plot 3
png(file = "plot3.png",width = 480, height = 480, units = "px") 
plot(hh_sub$dt, hh_sub$Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub metering")

lines(hh_sub$dt,hh_sub$Sub_metering_1,type="l", col ="black")
lines(hh_sub$dt,hh_sub$Sub_metering_2,type="l", col = "red")
lines(hh_sub$dt,hh_sub$Sub_metering_3,type="l", col = "blue")

legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 