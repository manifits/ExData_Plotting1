setwd("C:\\Users\\yeoch\\OneDrive - Hewlett-Packard\\Course2\\Data Science\\John Hopkins Data Science\\
      04 Exploratory Data Analysis\\Week 1\\Assignment")


##########################################################################
# Download and unzip the household power cosumptiond dataset
##########################################################################
filename <- "consume.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename)
}  

if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}


##########################################################################
# Load the power consumption data and convert dates
##########################################################################
consume <- read.table("household_power_consumption.txt",header=TRUE, sep=';', 
                      na.strings="?", stringsAsFactors=FALSE)
consume$Date <- as.Date(consume$Date, format="%d/%m/%Y")
head(consume)

##########################################################################
# Subset the data from the dates 2007-02-01 and 2007-02-02
##########################################################################
consumeSub <- consume[(consume$Date=="2007-02-01")|(consume$Date=="2007-02-02"),]

##########################################################################
# Combine Date and Time in the subset data
##########################################################################
consumeSub$DateTime <- as.POSIXct(paste(consumeSub$Date, consumeSub$Time))

##########################################################################
# Plot 4 Four plots: Global Active Power, Energy Sub Metering,
# Voltage, Global Reactive Power over Date-Time
##########################################################################
png(filename='plot4.png', width=480, height=480, units="px" )

par(mfrow=c(2,2))

# Plot 4.1
plot(consumeSub$DateTime, consumeSub$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="l")

# Plot 4.2
plot(consumeSub$DateTime, consumeSub$Voltage, xlab = 'datetime', 
     ylab = 'Voltage', type = 'l')

# Plot 4.3
plot(consumeSub$DateTime, consumeSub$Sub_metering_1, xlab = '', 
     ylab='Energy sub metering', type='l')
lines(consumeSub$DateTime,consumeSub$Sub_metering_2, col = 'red')
lines(consumeSub$DateTime, consumeSub$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd = 1)

# Plot4.4
plot(consumeSub$DateTime, consumeSub$Global_reactive_power, xlab = 'datetime', 
     ylab = 'Global_reactive_power', type = 'l')

dev.off()