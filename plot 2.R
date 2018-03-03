# Exploratory Data Analysis
# 3-3-2018 Week 1

#plot 2
data <- read.table("household_power_consumption.txt", header=T, sep=";")
Use <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# convert date and time vars
Use$Date <- as.Date(Use$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(Use$Date), Use$Time)
Use$Datetime <- as.POSIXct(DateTime)

Global_active_power <- as.numeric(as.character(Use$Global_active_power))

png("plot2.png", width=480, height=480)
plot(Use$Datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
