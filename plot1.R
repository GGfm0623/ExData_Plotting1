## plot1.R

## Load and subset data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
use <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Open PNG device
png("plot1.png", width = 480, height = 480)

## Plot 1: Histogram of Global Active Power
hist(use$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

## Close device
dev.off()
