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

plot(data2$Time2,data2$Global_active_power,xlab=" ",ylab="Global active Power (kilowatts)",type="l")

#register the plot with png format
dev.copy(png,file="plot2.png")
dev.off()

