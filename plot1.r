
##########################
#
# Plot1: Global Active Power
# Dimensions: Global Active Power x Frequency
#
#########################


# load data using another script on the project
source("loadData.r")
# loaded data frame name: house_power

hist(house_power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(device = png, filename="plot1.png", width=480, height=480)
dev.off()
