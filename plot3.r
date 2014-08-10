power<-read.csv("household_power_consumption.txt",sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

power <- power[(power$Date == "1/2/2007") | (power$Date == "2/2/2007"),]
power$Time <- paste(power$Date,power$Time)
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%d/%m/%Y %H:%M:%S")
par(bg=NA)
Sys.setlocale("LC_TIME", "English")

png(file="plot3.png",type = "windows",bg=NA)
plot(power$Time,power$Sub_metering_1,type="n",ylab="Engery sub metering",xlab="")
lines(power$Time,power$Sub_metering_1,type="l")
lines(power$Time,power$Sub_metering_2,type="l",col="red")
lines(power$Time,power$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()