# Exploratory Data Analysis
# 3-3-2018 Week 1

#plot 4
data <- read.table("household_power_consumption.txt", header=T, sep=";")
Use <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# convert date and time vars
Use$Date <- as.Date(Use$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(Use$Date), Use$Time)
Use$Datetime <- as.POSIXct(DateTime)

Global_active_power   <- as.numeric(as.character(Use$Global_active_power))
Global_reactive_power <- as.numeric(as.character(Use$Global_reactive_power))
voltage <- as.numeric(as.character(Use$Voltage))
Sub_metering_1 <- as.numeric(as.character(Use$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(Use$Sub_metering_2))

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(3,3,2,1), oma=c(0,0,1,0))

plot(Global_active_power~Use$Datetime, type="l", xlab="", ylab="Global Active Power")
plot(voltage~Use$Datetime, type="l", xlab="datetime", ylab="Voltage")

plot (Sub_metering_1~Use$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Use$Datetime, type="l", col="red")
lines(Use$Sub_metering_3~Use$Datetime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")

plot(Global_reactive_power~Use$Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
