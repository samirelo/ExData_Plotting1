plot2<-function() {

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

png(file="plot2.png",width=480,height=480)
plot(hpc$datetime,hpc$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

}

