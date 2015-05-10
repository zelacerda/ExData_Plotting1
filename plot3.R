Sys.setlocale("LC_ALL", "USA")

# Read dataset
all_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Filter days to analyse
measures <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007", ]

# Remove unfiltered data
rm(all_data)

# Convert Date and Time variables to Date/Time classes
measures$Datetime <- paste(measures$Date, measures$Time, sep = " ")
measures$Datetime <- strptime(measures$Datetime, format = "%d/%m/%Y %H:%M:%S")

# Plot3 - Energy sub meterings by hour
png("plot3.png", width = 480, height = 480)
plot(measures$Datetime, measures$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(measures$Datetime, measures$Sub_metering_2, type = "l", col="Red")
points(measures$Datetime, measures$Sub_metering_3, type = "l", col="Blue")
legend("topright", lwd = 1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()