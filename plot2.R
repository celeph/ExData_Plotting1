# Exploratory Data Analysis Course Project 1
# plot2.R
#
# Purpose:
# Render Plot 2: Global Active Power Thurs - Sat
#
# Usage:
# Set working directory to ExData_Plotting1 directory
# source("plot2.R")
#

# Load data
source("load_data.R")

# Reset mfrow and change background from transparent to white
par(mfrow = c(1,1))
par(bg="white") 

numrows <- nrow(household_power_consumption)

with(household_power_consumption, plot(
    1:numrows, 
    Global_active_power, 
    type="l",
    xlab="", 
    ylab="Global Active Power (kilowatts)",
    xaxt="n",
    bg="white"
))

axis(1, at=c(0, numrows/2, numrows), labels=c("Thu", "Fri", "Sat"))

rm("numrows")

# Save image
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
