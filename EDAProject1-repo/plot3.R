## R Script Name:  plot3.R
## Date Created:  5-10-2014
## Author:  Mbmoran
##
## Description: For May 2014 Exploratory Data Analysis Course, Project 1
## Source: UC Irvine Machine Learning Repo: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
## Dataset: "Individual household electric power consumption Data Set
##
## Objective: Produces 3 line graphs on one chart, of Sub_metering_1, _2 and _3 by day for Feb 01 to 02 2007
#############################################################################################################################################################################

## Code Begins Here
# sink("0-Fetch-Data.txt", split=TRUE)   # Save times, md5sum, other info in txt file
## library(downloader)  # download
## library(tools)       # md5sum
## Sys.time()           # Start time
## URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## zip.filename <- "exdata_data_household_power_consumption.zip"
## download(URL, zip.filename, mode="wb")      # Download from coursera site
## extracted.filename <- unzip(zip.filename)   # Extract file from ZIP
## myfile<-extracted.filename                  # Assign variable myfile to the extracted file
## file.info(zip.filename)                     # metadata about files
## file.info(extracted.filename)
## md5sum(zip.filename)                        # Record MD5sums
## md5sum(extracted.filename)
## Sys.time()           # End Time
## sink()

## Set working directory
setwd("c:\\users\\Mary\\My Documents\\Actuarial\\Coursera\\Data Science\\Exploratory Data Analysis\\R workspaces\\Data")

## Install and Require the package "sqldf"
install.packages("sqldf")
install.packages("tables")
require("tables")
require("sqldf")

myFile<- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql(myFile,mySql)
mydf<-as.data.frame(myData)

# Plot 3 Time Series plot by meter type
png(filename = "plot3.png", width = 480, height = 480)

wDays <- strptime(paste(mydf$Date, mydf$Time), format='%d/%m/%Y %H:%M:%S')
# mydf$wDays<-wDays

plot(wDays,mydf$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(wDays,mydf$Sub_metering_2,type="l",col="red")
lines(wDays,mydf$Sub_metering_3,type="l",col="blue")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Create png file
# dev.copy(png,file="plot3.png") # create png file
dev.off() # close the png device
