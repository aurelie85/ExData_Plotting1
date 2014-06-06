## Plot 2
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

#Convert the Date and Time variables to Date/Time
subdata$date.time <- strptime(paste(subdata$Date,subdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
str(subdata)


#Set the local system time. Maybe you don't have to do this if your local time is already in english.
Sys.setlocale(category = "LC_ALL", locale = "C")
#Make the beautiful plot.
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", bg = "transparent")
plot(subdata$date.time,subdata$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
#Copy the graphics contents of the current device.
dev.off()
