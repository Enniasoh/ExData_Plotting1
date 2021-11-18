## setwd("C:/Users/alisf/Desktop/Coursera/Exploratory data analysis assignment")

all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

subset_data <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, "%d/%m/%y")
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

##plotting line graph - type "l"
with(subset_data, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

##copying it from screen device
dev.copy(png, file="plot2.png", height=480, width=480)

##close off

dev.off()