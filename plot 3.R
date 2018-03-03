# Exploratory Data Analysis
# 3-3-2018 Week 1

#plot 3
data <- read.table("household_power_consumption.txt", header=T, sep=";")
Use <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# convert date and time vars
Use$Date <- as.Date(Use$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(Use$Date), Use$Time)
Use$Datetime <- as.POSIXct(DateTime)

Sub_metering_1 <- as.numeric(as.character(Use$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(Use$Sub_metering_2))

png("plot3.png", width=480, height=480)
plot (Use$Datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Use$Datetime, Sub_metering_2, type="l", col="red")
lines(Use$Datetime, Use$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()