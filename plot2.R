mydata <- read.csv("household_power_consumption.txt" , nrows = 70000 , header = TRUE, sep = ";",  stringsAsFactors=F)
mydata <- na.omit(mydata)
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Date <- as.Date(mydata$Date ,format="%d/%m/%Y" )
need <- mydata[(which(mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02")),]
data.time  <- as.POSIXct(paste(need$Date,need$Time))
plot( need$Global_active_power~data.time , type="l", xlab = "" , ylab = "Global_active_power" )
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
