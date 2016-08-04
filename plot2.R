## Downloading, unzipping and creating a temporary data file (then removing it)

    temp <- tempfile()

    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

    file <- unzip(temp)

    unlink(temp)

    
## Reading the data into a table, creating a subset of the relevant data, formatting the date and time columns for the plot.   

    powerdata <- read.table(file, header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".")

    powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
    
    powersub <- subset(powerdata, Date >= "2007/02/01" & Date <= "2007/02/02")
    

## Converting 
    
    DT <- paste(as.Date(powersub$Date), powersub$Time)
    
    powersub$Datetime <- as.POSIXct(DT)
    

## Function for Plot 2: Creating a plot for Global active power measured by date and time usage,  saving as a PNG file,and indicating where the file has been saved.

    plot2 <- function() {
    
        plot(powersub$Global_active_power~powersub$Datetime, type = "l", ylab = "Global Active Power", xlab = "")
        
        dev.copy(png, file = "plot2.png", height=480, width=480)
    
        dev.off()
    
        cat("Plot2.png has been saved in", getwd())
    
    }       

plot2()


