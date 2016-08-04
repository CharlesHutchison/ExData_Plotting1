## Downloading, unzipping and creating a temporary data file

    temp <- tempfile()

    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
    
    file <- unzip(temp)
    
    unlink(temp)

        
## Reading the data into a table, formatting the date, and creating a subset of the relevant data   
        
    powerdata <- read.table(file, header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".")
    
    powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
    
    powersub <- subset(powerdata, Date >= "2007/02/01" & Date <= "2007/02/02")
    
    GlobalActivePower <- as.numeric(powersub$Global_active_power)

        
## Function for Plot 1: Creating a histogram for Global active Power,  saving as a PNG file,and indicating where the file has been saved.

    plot1 <- function() {
    
        hist(GlobalActivePower, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
    
        dev.copy(png, file = "plot1.png", height=480, width=480)
       
        dev.off()
        
        cat("Plot1.png has been saved in", getwd())

    }       

    plot1()
    
   


    