# Exploratory Data Analysis Course Project 1
# plot1.R
#
# Purpose:
# Render Plot 1: Global Active Power
#
# Usage:
# Set working directory to ExData_Plotting1 directory
# source("plot1.R")
#

# Load data
source("load_data.R")

# Reset mfrow and change background from transparent to white
par(mfrow = c(1,1))
par(bg="white") 

# Draw histogram "Global Active Power"
hist(household_power_consumption$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Save image
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
