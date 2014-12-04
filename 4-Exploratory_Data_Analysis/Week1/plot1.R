######################################
##Plot1
par(mfrow=c(1,1))
####################
##Read Data

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

####################
##Format Dates and Subset

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

####################
##Make Histogram

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()