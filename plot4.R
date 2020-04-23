#reading of data
data=read.table(file = "household_power_consumption.txt", header=T, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

#conversion of Date in character class

data$Date=as.Date(data$Date, format="%d/%m/%Y")

#extraction of data of the two days indicated

data2=data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

#creation of a new colomn with Date/Time

data2$time_temp <- paste(data2$Date, data2$Time)

#change of format

data2$Time2 <- strptime(data2$time_temp, format = "%Y-%m-%d %H:%M:%S")

#settings plots
par(mfrow=c(2,2))

#plot1
plot(data2$Time2,data2$Global_active_power,xlab=" ",ylab="Global active Power (kilowatts)",type="l")

#plot2

plot(data2$Time2,data2$Voltage,xlab="datetime",ylab="Voltage",type="l")

#plot3

plot(data2$Time2,data2$Sub_metering_1,xlab=" ",ylab="Energy submetering",type="l")
lines(data2$Time2,data2$Sub_metering_2,type="l",col="red")
lines(data2$Time2,data2$Sub_metering_3,type="l",col="blue")
#legend

legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1:1:1,cex=0.8)


#plot4

plot(data2$Time2,data2$Global_reactive_power,xlab="datetime",ylab="Global reactive power",type="l")



#register the plot with png format
dev.copy(png,file="plot4.png")
dev.off()
