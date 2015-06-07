
##########################
#
# Plot4: Energy Sub Metering
# Dimensions: Energy Sub Metering x day
#
#########################


# load data using another script on the project
source("loadData.r")
# loaded data frame name: house_power

Sys.setlocale("LC_TIME", "C")

par(mfrow=c(2,2), mar=c(5,4,4,2), cex=0.7)


# plot 1.1
plot(x=house_power$timestamp, y=house_power$Global_active_power, type="l", main=NULL, ylab="Global Active Power", xlab="")

# plot 1.2
plot(x=house_power$timestamp, y=house_power$Voltage, type="l", main=NULL, ylab="Voltage", xlab="datetime")


# plot 2.1
plot(x=house_power$timestamp, y=house_power$Sub_metering_1, type="n", main=NULL, ylab="Energy Sub Metering", xlab="")
lines(x=house_power$timestamp, y=house_power$Sub_metering_1, col="green")
lines(x=house_power$timestamp, y=house_power$Sub_metering_2, col="red")
lines(x=house_power$timestamp, y=house_power$Sub_metering_3, col="blue")
legend(lwd=0.7, "topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("green", "red", "blue"), cex=0.4)


# plot 2.2
plot(x=house_power$timestamp, y=house_power$Global_reactive_power, type="l", main=NULL, ylab="Global Reactive Power", xlab="datetime")


dev.copy(device = png, filename="plot4.png", width=480, height=480)
dev.off()

