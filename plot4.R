# Exploratory Data Analysis Course Project 1
# plot4.R
#
# Purpose:
# Render Plot 4: Collection of four plots in one image
#
# Usage:
# Set working directory to ExData_Plotting1 directory
# source("plot4.R")
#

# Load data
source("load_data.R")

# Arrange plots in 2x2 grid, filling rows first
par(mfrow = c(2,2))

# Change background from transparent to white
par(bg="white") 


# First plot: See also plot2.R
numrows <- nrow(household_power_consumption)

with(household_power_consumption, plot(
    1:numrows, 
    Global_active_power, 
    type="l",
    xlab="", 
    ylab="Global Active Power",
    xaxt="n"
))

axis(1, at=c(0, numrows/2, numrows), labels=c("Thu", "Fri", "Sat"))


# Second plot
x_label = "datetime"
y_label = "Voltage"

with(household_power_consumption, plot(
    1:numrows,
    Voltage,
    type="l",
    xlab="datetime",
    ylab="Voltage",
    xaxt="n"
))

axis(1, at=c(0, numrows/2, numrows), labels=c("Thu", "Fri", "Sat"))


# Third plot: See also plot3.R
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
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")


# Fourth plot
y_label = "Global_reactive_power"
x_label = "datetime"
with(household_power_consumption, plot(
    1:numrows,
    Global_reactive_power, 
    type="l",
    xlab="datetime",
    ylab="Global_reactive_power",
    xaxt="n"
))

axis(1, at=c(0, numrows/2, numrows), labels=c("Thu", "Fri", "Sat"))

# Clean up          
rm("numrows")

# Save image
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
