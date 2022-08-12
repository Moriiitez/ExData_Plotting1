## Read the data

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

filename <- "Electric_Power_Consumption.zip"

if (!file.exists(filename)){
    download.file(url , filename)
}  

if (!file.exists("household_power_consumption")) { 
    unzip(filename) 
}
## Loading and Data Cleaning

t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

t$Date <- as.Date(t$Date, "%d/%m/%Y")

# subset the data from dates 2007-02-01 and 2007-02-02

t_sub <- subset(t , Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation

t_sub <- t_sub[complete.cases(t_sub),]

# Combine date and time

dateTime <- paste(t_sub$Date, t_sub$Time)
dateTime <- setNames(dateTime, "DateTime")
t_final <- cbind(dateTime, t_sub)
t_final$dateTime <- as.POSIXct(dateTime)