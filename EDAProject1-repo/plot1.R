## R Script Name:  plot1.R
## Date Created:  5-10-2014
## Author:  Mbmoran
##
## Description: For May 2014 Exploratory Data Analysis Course, Project 1
## Source: UC Irvine Machine Learning Repo: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
## Dataset: "Individual household electric power consumption Data Set"
## 
## Objective: This script reads in the power consumption data set and produces a histogram of the frequency of variable "Global_active_power" = Global Active Power in kwatts
#############################################################################################################################################################################

## Code Begins Here
## sink("0-Fetch-Data.txt", split=TRUE)   # Save times, md5sum, other info in txt file
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

Install and Require the package "sqldf"
install.packages("sqldf")
install.packages("tables")
require("tables")
require("sqldf")

myFile<- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql(myFile,mySql)

# Plot 1 Histogram
png(filename = "plot1.png", width = 480, height = 480)

hist(myData$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
#dev.copy(png,file="plot1.png") # create png file
dev.off() # close the png device

