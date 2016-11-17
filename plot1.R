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
consumeSub <- consume[(consume$Date=="2007-02-01")|(consume$Date=="2007-02-consum02"),]

##########################################################################
# Plot 1 Histogram of Global Active Power
##########################################################################
png(filename='plot1.png', width=480, height=480, units="px" )
with(consumeSub, hist(Global_active_power, main="Global Active Power", 
                      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))
dev.off()





