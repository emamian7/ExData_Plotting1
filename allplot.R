Data1 <- read.table('household_power_consumption.txt', na.strings = "?", sep = ';', quote = "")
tail(Data1, 10)
colnames(Data1) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
  'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')
Data1$DateTime <- strptime(paste(Data1$Date, Data1$Time), format = '%d/%m/%Y %H:%M:%S')
####Plot 1
hist(as.numeric(Data1$GlobalActivePower), col = 'blue')
xlab = 'Global Active Power'
### #Plot 2
plot(x = Data1$DateTime, y = Data1$GlobalActivePower, ylab = 'Global Active Power')
### #Plot 3
par(mar=c(1,1,1,1))
plot(x = Data1$DateTime, y = Data1$SubMetering1, ylab = 'Energy sub metering')
lines(x = Data1$DateTime, y = Data1$SubMetering2, col = 'blue')
lines(x = Data1$DateTime, y = Data1$SubMetering3, col = 'red')
  legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'blue', 'red'),
   #dev.off()
## Plot# 4
#png('plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2)) 
#####plot 4a = plot 1
plot(x = Data1$DateTime, y = Data1$GlobalActivePower,  ylab = 'Global Active Power')
########plot 4b
plot(x = Data1$DateTime, y = Data1$Voltage, xlab = 'datetime', ylab = 'Voltage')
###########plot 4c = plot 3
plot(x = Data1$DateTime, y = Data1$SubMetering1, ylab = 'Energy sub metering')
lines(x = Data1$DateTime, y = Data1$SubMetering2, col = 'red')
lines(x = Data1$DateTime, y = Data1$SubMetering3, col = 'blue')
legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
col = c('black', 'red', 'blue'),
######plot 4d
plot(x = Data1$DateTime, y = Data1$GlobalReactivePower)
 xlab = 'DateTime', ylab = 'GlobalReactivePower')
#dev.off()
