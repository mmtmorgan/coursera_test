######################################
##Plot4

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

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

########TopLeft
plot(datetime, data$Global_active_power, type="l", xlab= "", ylab="Global Active Power")

########TopRight
plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage", cex=0.2)

########BottomLeft
plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "blue", "red"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

########BottomRight
plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()