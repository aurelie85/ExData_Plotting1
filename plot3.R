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


#Set the local system time.
Sys.setlocale(category = "LC_ALL", locale = "C")
#Make the beautiful plot. First make the plot with one line and then add all the lines that you want, 
#with different colors.
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", bg = "transparent")
plot(subdata$date.time,subdata$Sub_metering_1,
     type="l",
     ylab = "Energy sub metering",
     xlab = "",
     col = "black")
lines(subdata$date.time,subdata$Sub_metering_2, col = "red")
lines(subdata$date.time,subdata$Sub_metering_3, col = "blue")
#add a legend.
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copy the graphics contents of the current device.
dev.off()
