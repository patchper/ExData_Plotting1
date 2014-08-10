power<-read.csv("household_power_consumption.txt",sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
power$Time <- paste(power$Date,power$Time)
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%d/%m/%Y %H:%M:%S")
par(bg=NA)
Sys.setlocale("LC_TIME", "English")


png(file="plot2.png",type = "windows",bg=NA)
plot(power$Time,power$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()