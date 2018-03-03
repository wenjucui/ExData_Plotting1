# Exploratory Data Analysis
# 3-3-2018 Week 1

dir()

#plot 1
data <- read.table("household_power_consumption.txt", header=T, sep=";")
Use <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
str(Use)
typeof(Use)
typeof(Use$Global_active_power)

Global_active_power <- as.numeric(as.character(Use$Global_active_power))

png("plot1.png", width=480, height=480)
hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()