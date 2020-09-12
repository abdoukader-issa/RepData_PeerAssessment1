## reading data from downloaded file

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

## Extract only 2007-02-01 and 2007-02-02 data

data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") 

## converting Date and time variables in Date/time classe

?strptime
?as.Date
?hist

data2$Date <- as.Date(data2$Date, format = "%d/%m/%y")
class(data2$Date)
data2$Time <- strptime(data2$Time, format = "%H:%M:%S")
class(data2$Time)
class(data2$Global_active_power)

hist(as.numeric(data2$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## copy in png file
dev.copy(png, file = "plot1.png")
dev.off()
