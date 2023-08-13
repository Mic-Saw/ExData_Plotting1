plot2 <- function(path = "./Downloads/household_power_consumption.txt") {
  #Read the data
  data <- read.csv(path, sep=";")
  ## Transform date and take subset of data we are interested in
  data$Date <- as.Date(data$Date, format='%d/%m/%Y')
  data_subset <- data[data$Date == as.Date('2007-02-01') | data$Date == as.Date('2007-02-02'),]
  ## Remove huge and unnecessary data
  rm(data)
  
  ## Plot 2
  # Generate x - values for 2 days (in seconds)
  second <- 0:2879
  png(filename="./Downloads/plot2.png", width=480, height=480)
  plot(second, data_subset$Global_active_power, type="l", xlab='', ylab='Global Active Power (kilowatts)', xaxt="n")
  axis(1, at=c(0, 1440, 2879), labels=c("Thu", "Fri", "Sat"))
  dev.off()
}