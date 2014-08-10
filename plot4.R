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

## PLOT 4 - plot 4 small graphs into same frame ####
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(mydata, plot(Time, Global_active_power
                  , type="l"
                  , xlab=NA
                  , ylab="Global Active Power (kilowatts)"
))  ## plot global active power over time
with(mydata, plot(Time, Voltage
                  , type="l"
                  , xlab="datetime"
                  , ylab="Voltage"))  ## plot voltage over time

plot(mydata$Time, mydata$Sub_metering_1, type="l", col="black"
     , ylab="Energy sub metering", xlab=NA)
lines(mydata$Time, mydata$Sub_metering_2, col="red")
lines(mydata$Time, mydata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , xjust=0
       , bty="n"
       , lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       , lwd=c(2,2,2)
       , col=c("black","red","blue")) # gives the legend lines the correct color and width)
## plot 3 sub meterings' usage
with(mydata, plot(Time, Global_reactive_power
                  , type="l"
                  , xlab="datetime"
                  , ylab="Global reactive power"))
dev.off()
