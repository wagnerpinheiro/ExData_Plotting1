
##########################
#
# Plot3: Energy Sub Metering
# Dimensions: Energy Sub Metering x day
#
#########################


# load data using another script on the project
source("loadData.r")
# loaded data frame name: house_power

Sys.setlocale("LC_TIME", "C")

plot(x=house_power$timestamp, y=house_power$Sub_metering_1, type="n", main="Energy Sub Metering x Day", ylab="Energy Sub Metering", xlab="")
lines(x=house_power$timestamp, y=house_power$Sub_metering_1, col="green")
lines(x=house_power$timestamp, y=house_power$Sub_metering_2, col="red")
lines(x=house_power$timestamp, y=house_power$Sub_metering_3, col="blue")
legend(lwd=0.7, "topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("green", "red", "blue"), cex=0.7)
dev.copy(device = png, filename="plot3.png", width=480, height=480)
dev.off()

