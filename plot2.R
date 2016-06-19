# read the data
hh <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", 
                    na.strings = "?",stringsAsFactors = FALSE)

library(dplyr)
hh_sub <- filter(hh, Date == '1/2/2007' | Date == '2/2/2007')
# concatenate date and time
hh_sub$dtime <- paste(hh_sub$Date, hh_sub$Time)
# convert date and time character to POSIXct
hh_sub$dt <- strptime(hh_sub$dtime, "%d/%m/%Y %H:%M:%S")

# create plot
png(file = "plot2.png",width = 480, height = 480, units = "px") 
with(hh_sub, plot(dt, Global_active_power, type="l", xlab ="", ylab = "Global Active Power (Kilowatts)"))
dev.off() 
