getwd()
setwd("~/Coursera/Data Science Specialization/4. Exploratory Data Analysis/Assignment/ExData_Plotting1")

#Read data into R.
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?")
#Subsetting data.
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
#head(subdata)

subdata$date.time <- strptime(paste(subdata$Date,subdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
str(subdata)

#Make the beautiful plot.
#Set the local system time.
Sys.setlocale(category = "LC_ALL", locale = "C")
plot(subdata$date.time,subdata$Global_active_power,type="n",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
lines(subdata$date.time,subdata$Global_active_power)
#Copy the graphics contents of the current device.
dev.copy(png,file="plot2.png", width = 480, height = 480, units = "px")
dev.off()
