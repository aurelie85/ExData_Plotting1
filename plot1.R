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

#Make the beautiful plot.
par(mfrow=c(1,1))
hist(subdata$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "red")
#Copy the graphics contents of the current device.
dev.copy(png,file="plot1.png", width = 480, height = 480, units = "px")
dev.off()
