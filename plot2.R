# Script name:  plot2.R
# Author:       Allen Blackburn
# Description:  This script will generate a plot as described in the project
#               to a png file.

# Load libraries
library(dplyr)
library(grDevices)
library(graphics)
library(utils)

# Source location of uncompressed data
datafile <- "data/household_power_consumption.txt"

# Read the data into a data frame
alldata <- read.table("data/household_power_consumption.txt", header = TRUE, 
        stringsAsFactors = FALSE, sep = ";", na.strings = "?", nrows=2075259)

# Subset of data containing only the two days we want
data_sub <- filter(alldata, Date == "1/2/2007" | Date == "2/2/2007")

# Open the graphics device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Generate the plot
plot(data_sub$Global_active_power, type = "l", xlab = "", 
        ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))

# Close the graphics device
dev.off()