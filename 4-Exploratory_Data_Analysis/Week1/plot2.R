######################################
##Plot2
par(mfrow=c(1,1))
####################
##Read Data

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

####################
##Format Dates and Subset

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- as.POSIXct(paste(data$Date, data$Time, sep=" "))

####################
##Make Plot

png("plot2.png", width=480, height=480)
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()