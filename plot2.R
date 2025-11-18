## plot2.R

## Load and subset data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
use <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
use$Datetime <- as.POSIXct(paste(use$Date, use$Time))

## Open PNG device
png("plot2.png", width = 480, height = 480)

## Plot 2: Global Active Power vs time
plot(use$Datetime, use$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Close device
dev.off()
