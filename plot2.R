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

# Plot2 - Global active power by hour
png("plot2.png", width = 480, height = 480)
plot(measures$Datetime, measures$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()