mydata <- read.csv("household_power_consumption.txt" , nrows = 70000 , header = TRUE, sep = ";",  stringsAsFactors=F)
mydata <- na.omit(mydata)
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Date <- as.Date(mydata$Date ,format="%d/%m/%Y" )
need <- mydata[(which(mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02")),]
data.time  <- as.POSIXct(paste(need$Date,need$Time))
need$Sub_metering_1 <- as.numeric(need$Sub_metering_1)
need$Sub_metering_2 <- as.numeric(need$Sub_metering_2)
need$Sub_metering_3 <- as.numeric(need$Sub_metering_3)
need$Voltage <- as.numeric(need$Voltage)
need$Global_reactive_power <- as.numeric(need$Global_reactive_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(need, {
  plot(Global_active_power~data.time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~data.time, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~data.time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~data.time,col='Red')
  lines(Sub_metering_3~data.time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, bty="n", pt.cex = 1 ,cex = .60 ,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~data.time, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
