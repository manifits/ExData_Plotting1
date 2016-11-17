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
# Plot 2 Plot of Global Active Power over Date-Time
##########################################################################
png(filename='plot2.png', width=480, height=480, units="px" )
with(consumeSub, plot(DateTime, Global_active_power, type="l", xlab="", 
                      ylab="Global Active Power (kilowatts)"))
dev.off()





