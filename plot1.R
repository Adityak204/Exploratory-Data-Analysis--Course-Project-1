mydata <- read.csv("household_power_consumption.txt" , nrows = 70000 , header = TRUE, sep = ";",  stringsAsFactors=F)
mydata <- na.omit(mydata)
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Date <- as.Date(mydata$Date ,format="%d/%m/%Y" )
need <- mydata[(which(mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02")),]
hist(need$Global_active_power , col = "red" ,main="Global Active Power", xlab="Global Active Power (kilowatts)" )

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
