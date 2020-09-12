## plot2 script

## reading data from downloaded file

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

## Extract only 2007-02-01 and 2007-02-02 data

data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") 

## converting Date and time variables in Date/time classe

data2$Date <- as.Date(data2$Date, format = "%d/%m/%y")
data2$Time <- strptime(data2$Time, format = "%H:%M:%S")
data2[1:1440,"Time"] <- format(data2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data2[1441:2880,"Time"] <- format(data2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## Create plot 

with(data2, plot(Time, as.numeric(data2$Global_active_power), xlab = "", 
                 ylab = "Global Active Power (kilowatts)", type = "l",
                 main = "Global Active Power"))

## copy in png file
dev.copy(png, file = "plot2.png")
dev.off()

