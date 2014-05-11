plot4<-function() {

hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                   sep = ";", colClasses="character",
                   col.names = colnames(read.table("household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))



for( i in 1:9) {
  hpc[hpc[, i] == "?"] <- "NA"
}

for(i in 3:9){
  hpc[, i] <- as.numeric(hpc[, i])
}

for( i in 1:2) {
  hpc[, i] <- as.character(hpc[, i])
}

hpc$datetime<- as.POSIXlt(paste(hpc$Date,hpc$Time))
hpc$datetime<- paste(hpc$Date,hpc$Time)
hpc$datetime<- strptime(DateTime, "%d/%m/%Y %H:%M:%S")


png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(hpc$datetime,hpc$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")

plot(hpc$datetime,hpc$Voltage,type="l",xlab="datetime",ylab="Voltage")


plot(hpc$datetime,hpc$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(hpc$datetime, as.numeric(as.character(hpc$Sub_metering_2)), type = "l", col = "red")
lines(hpc$datetime, as.numeric(as.character(hpc$Sub_metering_3)), type = "l", col = "blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),bty="n",cex = 0.95,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(hpc$datetime,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")



dev.off()

}
