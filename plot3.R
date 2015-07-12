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
    
    ## Create plot in viewer, add additional lines and legend
    plot(data$DateTime,data$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
    lines(data$DateTime,data$Sub_metering_2,col="red")
    lines(data$DateTime,data$Sub_metering_3,col="blue")
    legend("topright",lty="solid",cex=.6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
    
    ## Copy viewer to png file
    dev.copy(png,file="plot3.png",width=480,height=480)
    dev.off()
}