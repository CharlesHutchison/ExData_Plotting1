## Downloading, unzipping and creating a temporary data file (then removing it)

    temp <- tempfile()

    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

    file <- unzip(temp)

    unlink(temp)

    
## Reading the data into a table, creating a subset of the relevant data, formatting the date and time columns for the plot.   

    powerdata <- read.table(file, header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".")

    powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

    powersub <- subset(powerdata, Date >= "2007/02/01" & Date <= "2007/02/02")



## Creating a combined columb of date and time to compare against sub-metering. 

    DT <- paste(powersub$Date, powersub$Time)

    powersub$Datetime <- as.POSIXct(DT)


    
## Function for Plot 3: Creating three plot lines for each of the Sub_metering columns. Creating a legend for the informaiton and printing to a PNG file.

    plot3 <- function() {
    
        plot(powersub$Datetime, as.numeric(powersub$Sub_metering_1), type = "l", col = "black", ylab = "Energy Sub metering", xlab = " ")
    
        lines(powersub$Datetime, as.numeric(powersub$Sub_metering_2), type = "l", col = "red")
    
        lines(powersub$Datetime, as.numeric(powersub$Sub_metering_3), type = "l", col = "blue")
    
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
    
        dev.copy(png, file = "plot3.png", height=480, width=480)
    
        dev.off()
    
        cat("Plot3.png has been saved in", getwd())
    
    }       

plot3()

