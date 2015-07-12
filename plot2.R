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
    
    ## Create plot in viewer
    plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    ## Copy viewer to png file
    dev.copy(png,file="plot2.png",width=480,height=480)
    dev.off()
}