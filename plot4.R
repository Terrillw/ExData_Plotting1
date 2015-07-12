run <- function() {
    ## Source file should be extracted in working directory
    fileName <- "./exdata/household_power_consumption.txt"
    
    ## Read in full data set
    fullData <- read.table(fileName, header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
    
    ## Select only data for the two specified days
    data <- fullData[fullData$Date=="1/2/2007" | fullData$Date=="2/2/2007",]
    
    ## Create combined datetime column at end of data dataframe
    data <- cbind(data, (dmy(data$Date) + hms(data$Time)))
    names(data)[10] <- "DateTime"
    
    ## Create 2x2 set of plots in viewer
    par(mfrow = c(2, 2))
    with(data, {
        plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",cex.lab=0.75,cex.axis=0.75)
        
        plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime",cex.lab=0.75,cex.axis=0.75)
        
        plot(data$DateTime,data$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="",cex.lab=0.75,cex.axis=0.75)
        lines(data$DateTime,data$Sub_metering_2,col="red")
        lines(data$DateTime,data$Sub_metering_3,col="blue")
        legend("topright",lty=1,cex=.35,bty='n',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
        
        plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime",cex.lab=0.75,cex.axis=0.75)         
    })
    
    ## Copy viewer to png file
    dev.copy(png,file="plot4.png",width=480,height=480)
    dev.off()
}