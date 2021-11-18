## setwd("C:/Users/alisf/Desktop/Coursera/Exploratory data analysis assignment")

all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

subset_data <- subset(all_data, Date %in% c("1/2/2007","2.2.2007"))
subset_data$Date <- as.Date(subset_data$Date, "%d/%m/%y")

##plotting histogram - plot 1

hist(subset_data$Global_active_power, main = "Global Active Power", col = "Red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency" )

## save to png file

png("plot1.png", width = 480, height = 480)

##close off

dev.off()

