#reading of data
data=read.table(file = "household_power_consumption.txt", header=T, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

#conversion of Date in character class

data$Date=as.Date(data$Date, format="%d/%m/%Y")

#extraction of data of the two days indicated

data2=data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

#plot1

hist(data2$Global_active_power,col="red",main="Global Active Power",xlab="Global active Power (kilowatts)")

#register the plot with png format
dev.copy(png,file="plot1.png")
dev.off()
