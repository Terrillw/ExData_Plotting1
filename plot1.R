run <- function() {
    ## Source file should be extracted in working directory
    fileName <- "./exdata/household_power_consumption.txt"
    
    ## Read in full data set
    fullData <- read.table(fileName, header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
    
    ## Select only data for the two specified days
    data <- fullData[fullData$Date=="1/2/2007" | fullData$Date=="2/2/2007",]
    
    ## Create histogram plot in viewer
    hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    
    ## Copy viewer to png file
    dev.copy(png,file="plot1.png",width=480,height=480)
    dev.off()
}