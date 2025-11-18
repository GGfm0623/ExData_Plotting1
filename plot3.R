## plot3.R

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
png("plot3.png", width = 480, height = 480)

## Plot 3: Energy sub metering
plot(use$Datetime, use$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(use$Datetime, use$Sub_metering_2, col = "red")
lines(use$Datetime, use$Sub_metering_3, col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close device
dev.off()
