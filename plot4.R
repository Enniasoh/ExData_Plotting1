## setwd("C:/Users/alisf/Desktop/Coursera/Exploratory data analysis assignment")

all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

subset_data <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, "%d/%m/%y")
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

##set mfrow to 2,2 to draw 4 plots
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##plot top left
with(subset_data,
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab=""))

##plot top right
with(subset_data,
     plot(Voltage~Datetime, type="l", 
          ylab="Voltage", xlab=""))

##plot bottom left
with(subset_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')})

##plot top right
with(subset_data,
     plot(Global_reactive_power~Datetime, type="l", 
          ylab="Global_reactive_power", xlab=""))

##save to file
dev.copy(png, file="plot4.png", height=480, width=480)

## to close off
dev.off()


