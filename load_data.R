# Exploratory Data Analysis Course Project 1
# load_data.R
#
# Purpose:
# Load data set. 
# - Download zip file if not already downloaded
# - Unzip data
# - Reduce data to relevant rows
#
# Usage:
# Set working directory to ExData_Plotting1 directory
# source("load_data.R")
# Dataset will be available in "household_power_consumption"

# Download zip file if not already downloaded
dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("Dataset.zip")) {
	download.file(dataurl, destfile = "Dataset.zip", method="curl")
}

# Unzip data
datafile <- "household_power_consumption.txt"
if (!file.exists(datafile)) {
	unzip(zipfile = "Dataset.zip")
}

reducedfile <- "reduced.txt"
if (file.exists(reducedfile)) {
	# If we have a reduced dataset already, just load it...
	household_power_consumption <- read.table(reducedfile, sep=";", header=TRUE,
		colClasses = c("Date", "factor", "numeric", "numeric", "numeric", "numeric", "integer", "integer", "integer", "POSIXct")
	)
	
} else {
	# ... otherwise create a new set:
	
	# Read data for dates 2007-02-01 and 2007-02-02.
	# To keep memory usage low, read the file in chunks
	maxrows <- 1000

	con <- file(datafile, "r", blocking = FALSE)

	# Fetch column names from the first row
	header <- read.table(con, nrows=1, sep=";")
	columnnames <- as.character(unlist(header[1,]))

	# Create an empty data frame to add rows to
	household_power_consumption <- data.frame(
		V1=character(), V2=character(), V3=character(), V4=character(), V5=character(), V6=character(), V7=character(), V8=character(), V9=character()
	)

	repeat {
		data <- try(read.table(con, nrows=maxrows, sep=";", na.strings="?"))
		if (nrow(data) < maxrows) break

		data <- data[which(data$V1=="1/2/2007" | data$V1=="2/2/2007"),]
		if (nrow(data) > 0) {
			household_power_consumption <- rbind(household_power_consumption, data)
		}
	}
	close(con)

	# Set proper column names
	names(household_power_consumption) <- columnnames
	
	# Add a new column with date and time combined
	household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), "%d/%m/%Y %H:%M:%S")
	
	# Change Date column to Date class
	household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date, "%d/%m/%Y"))
	
	# Store the reduced data set so we don't have to do this again for every plot
	write.table(household_power_consumption, reducedfile, sep=";", row.names=FALSE)
	
	# Clean up
	rm("maxrows")
	rm("header")
	rm("columnnames")
	rm("data")
}

# Clean up
rm("dataurl")
rm("datafile")
rm("reducedfile")
