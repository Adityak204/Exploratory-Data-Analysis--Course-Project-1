mydata <- read.csv("household_power_consumption.txt" , nrows = 70000 , header = TRUE, sep = ";",  stringsAsFactors=F)
mydata <- na.omit(mydata)
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Date <- as.Date(mydata$Date ,format="%d/%m/%Y" )
need <- mydata[(which(mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02")),]
data.time  <- as.POSIXct(paste(need$Date,need$Time))
need$Sub_metering_1 <- as.numeric(need$Sub_metering_1)
need$Sub_metering_2 <- as.numeric(need$Sub_metering_2)
need$Sub_metering_3 <- as.numeric(need$Sub_metering_3)
with(need,  {plot(Sub_metering_1~data.time, type="l",
                ylab="Global Active Power (kilowatts)", xlab="")
     lines(Sub_metering_2~data.time,col='Red')
     lines(Sub_metering_3~data.time,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

