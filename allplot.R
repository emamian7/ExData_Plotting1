DATA <- "household_power_consumption.txt"
data <- read.table(DATA, header=TRUE, sep=";")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
colnames(DATA) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage', 'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

####Plot 1
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
   ### #Plot 2
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
   ### #Plot 3
globalActivePower <- as.numeric(subSetData$Global_active_power)
sub_Metering1 <- as.numeric(subSetData$Sub_metering_1)
sub_Metering2 <- as.numeric(subSetData$Sub_metering_2)
sub_Metering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Metering2, type="l", col="red")
lines(datetime, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()        
           
  ## Plot# 4

globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
png ("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 			
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Metering2, type="l", col="red")
lines(datetime, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
			

dev.off() 


