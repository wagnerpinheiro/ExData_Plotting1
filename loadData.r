# Introduction
# 
# This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:
#   
#   Dataset: Electric power consumption [20Mb]
# 
# Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
# 
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#   
#   Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

# Loading the data
# 
# When loading the dataset into R, please consider the following:
#   
#   The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
# 
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
# 
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
# 
# Note that in this dataset missing values are coded as ?.


library(RCurl)

file1 <- 'household_power_consumption.txt'

# download and unzip file if not exists in current directory
if(length(dir(".", pattern=file1)) == 0 ){
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'power.zip', method = 'curl')
  unzip('power.zip')
}

# set here the start and end line of file to load
# use 0 if you dont know
line_start <- 66638
line_end <- 69517

# if not setted line_end, get the line numbers from file
if(line_end == 0){
  filecontent <- readLines(file1)
  
  print("Estimated data size: ")
  print(object.size(filecontent))
  
  # from 2007-02-01
  line_start <- head(grep('^1.2.2007', filecontent), 1)
  print("Line start: ")
  print(line_start)
  
  # to 2007-02-02
  line_end <- tail(grep('^2.2.2007', filecontent), 1)
  print("Line end: ")
  print(line_end)
  
  # clean memory
  rm(filecontent)
}

# get data header
house_power_header <- read.csv(file1, nrows=1, sep = ';')

# get only necessary data
house_power <- read.csv(file1, skip = line_start - 1, nrows=line_end - line_start, header = F, sep = ';')

#some info
str(house_power)
head(house_power)
tail(house_power)

# set variables names from data header
names(house_power) <- names(house_power_header)
rm(house_power_header)

# convert date and time to timestamp
house_power$timestamp <- strptime(paste(house_power$Date, house_power$Time), "%d/%m/%Y %H:%M:%S")
# and check class 
class(house_power$timestamp)
