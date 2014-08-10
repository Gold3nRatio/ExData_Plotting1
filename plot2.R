#### Data Science - Exploratory Data Analysis ####
## Assignment 1 ##

mydata <- read.table('household_power_consumption.txt', header=TRUE, sep=";", dec=".",
                     nrows=2880, skip=66636, na.strings="?")
names(mydata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power"
                   , "Voltage", "Global_intensity", "Sub_metering_1"
                   , "Sub_metering_2", "Sub_metering_3")
# change the date format
mydata[, 1] <- as.Date(mydata[, 1], format="%d/%m/%Y")
mydata[, 2] <- as.POSIXct(paste(mydata[,1], mydata[,2]))

## PLOT 2 - plot the usage over time ####
png("plot2.png", width=480, height=480)
with(mydata, plot(Time, Global_active_power
                  , type="l"
                  , xlab=NA
                  , ylab="Global Active Power (kilowatts)"
))
dev.off()