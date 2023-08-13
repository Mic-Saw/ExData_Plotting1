plot1 <- function(path = "./Downloads/household_power_consumption.txt") {
  #Read the data
  data <- read.csv(path, sep=";")
  ## Transform date and take subset of data we are interested in
  data$Date <- as.Date(data$Date, format='%d/%m/%Y')
  data_subset <- data[data$Date == as.Date('2007-02-01') | data$Date == as.Date('2007-02-02'),]
  ## Remove huge and unnecessary data
  rm(data)
  ## Plot 1
  png(filename="./Downloads/plot1.png", width=480, height=480)
  hist(as.numeric(data_subset$Global_active_power),col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency')
  dev.off()
}
