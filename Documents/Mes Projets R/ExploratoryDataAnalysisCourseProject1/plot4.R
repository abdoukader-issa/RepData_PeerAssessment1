## plot 3 script

## reading data from downloaded file

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

## Extract only 2007-02-01 and 2007-02-02 data

data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") 

## converting Date and time variables in Date/time classe

data2$Date <- as.Date(data2$Date, format = "%d/%m/%y")
data2$Time <- strptime(data2$Time, format = "%H:%M:%S")
data2[1:1440,"Time"] <- format(data2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data2[1441:2880,"Time"] <- format(data2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## create plot

par(mfrow = c(2,2))

## Graph 1
with(data2, plot(Time, as.numeric(data2$Global_active_power), xlab = "", 
                 ylab = "Global Active Power", type = "l"))

## Graph 2
with(data2, plot(Time,as.numeric(Voltage), type="l",xlab="datetime",ylab="Voltage"))

## Graph 3
plot(data2$Time,data2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data2,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data2,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data2,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 0.2)

## Graph 4
with(data2, plot(Time,as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power"))

## copy in png file
dev.copy(png, file = "plot4.png")
dev.off()
