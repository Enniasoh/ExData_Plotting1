## setwd("C:/Users/alisf/Desktop/Coursera/Exploratory data analysis assignment")

all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

subset_data <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, "%d/%m/%y")
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

##plot 3
with(subset_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

## add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

