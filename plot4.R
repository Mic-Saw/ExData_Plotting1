plot4 <- function(path = "./Downloads/household_power_consumption.txt") {
  #Read the data
  data <- read.csv(path, sep=";")
  ## Transform date and take subset of data we are interested in
  data$Date <- as.Date(data$Date, format='%d/%m/%Y')
  data_subset <- data[data$Date == as.Date('2007-02-01') | data$Date == as.Date('2007-02-02'),]
  ## Remove huge and unnecessary data
  rm(data)
  
  ## Plot 3
  # Generate x - values for 2 days (in seconds)
  second <- 0:2879
  
  png(filename="./Downloads/plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  with(data_subset, {
    # 1 
    plot(second, data_subset$Global_active_power, type="l", xlab='', ylab='Global Active Power', xaxt="n")
    axis(1, at=c(0, 1440, 2879), labels=c("Thu", "Fri", "Sat"))
    # 2 
    plot(second, data_subset$Voltage, type="l", xlab='datetime', ylab='Voltage', xaxt="n")
    axis(1, at=c(0, 1440, 2879), labels=c("Thu", "Fri", "Sat"))
    # 3
    plot(second, data_subset$Sub_metering_1, type="l", xlab='', ylab='Energy sub metering', xaxt="n")
    lines(second, data_subset$Sub_metering_2, type="l", col='red')
    lines(second, data_subset$Sub_metering_3, type="l", col='blue')
    axis(1, at=c(0, 1440, 2879), labels=c("Thu", "Fri", "Sat"))
    legend("topright", lwd=2, bty="n",col=c("black", "red", "blue"), legend=c("Sub_metring_1", "Sub_metring_2", "Sub_metring_3"))
    # 4
    plot(second, data_subset$Global_reactive_power, type="l", xlab='datetime', ylab='Global_reactive_power', xaxt="n")
    axis(1, at=c(0, 1440, 2879), labels=c("Thu", "Fri", "Sat"))
  })
dev.off()
}