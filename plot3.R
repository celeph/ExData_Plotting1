# Exploratory Data Analysis Course Project 1
# plot3.R
#
# Purpose:
# Render Plot 3: Energy sub metering Thurs - Sat
#
# Usage:
# Set working directory to ExData_Plotting1 directory
# source("plot3.R")
#

# Load data
source("load_data.R")

# Reset mfrow and change background from transparent to white
par(mfrow = c(1,1))
par(bg="white") 

numrows <- nrow(household_power_consumption)

# create first plot with axis ticks and labels
with(household_power_consumption, plot(
    1:numrows, 
    Sub_metering_1, 
    type="l",
    xlab="", 
    ylab="Energy sub metering",
    xaxt="n"
))

axis(1, at=c(0, numrows/2, numrows), labels=c("Thu", "Fri", "Sat"))

# add second plot in red
with(household_power_consumption, points(
    1:numrows, 
    Sub_metering_2, 
    type="l",
    col="red"
))

# add third plot in blue
with(household_power_consumption, points(
    1:numrows, 
    Sub_metering_3, 
    type="l",
    col="blue"
))

# add legend
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

rm("numrows")

# Save image
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
