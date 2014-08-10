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


## PLOT 1 - plot the frequency of active power (kw)
png("plot1.png", width=480, height=480)
with(mydata, hist(Global_active_power
                  , main="Global Active Power"
                  , xlab="Global Active Power (kilowatts)"
                  , col="red"
                  , xlim=c(0,10)
                  , axes=FALSE
))
axis(1, at = c(0,2,4,6), labels = TRUE, tick = TRUE)
axis(2, tick=TRUE)
dev.off()