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
#Make the beautiful plots, (2by2)
#Open a graphic device. The size of the legend is then better.
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2, 2))
#Firt plot, top left.
plot(subdata$date.time,subdata$Global_active_power,type="l",
     ylab = "Global Active Power",
     xlab = "")
#Second plot, top right.
plot(subdata$date.time, subdata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
#Third plot, bottom left.
plot(subdata$date.time,subdata$Sub_metering_1,
     type="l",
     ylab = "Energy sub metering",
     xlab = "",
     col = "black")
lines(subdata$date.time,subdata$Sub_metering_2, col = "red")
lines(subdata$date.time,subdata$Sub_metering_3, col = "blue")
#add a legend.
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Fourth plot, bottom right.
plot(subdata$date.time, subdata$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
