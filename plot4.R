print("plot4.R -->")
#Change locale to English
Sys.setlocale("LC_ALL","English")
#Source file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption.txt"
#Download file if not exists in the work directory
if(!file.exists("exdata-data-household_power_consumption.zip")
   & !file.exists(file)){
  #In windows 10, mode="wb" for avoid problems in the download file
  download.file(fileUrl, "exdata-data-household_power_consumption.zip", mode="wb")
}
#Unzip file if it is zipped
if(!file.exists(file) 
   & file.exists("exdata-data-household_power_consumption.zip")){
  unzip("exdata-data-household_power_consumption.zip")
}
#Check if file exists
if(file.exists(file)){
  #Header
  header <- read.table(file, header = FALSE,  sep = ";", na.strings = "?", nrows = 1, stringsAsFactors = FALSE)
  #Subset
  data <- read.table(file, header = FALSE,  sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
  #Restore columns names
  names(data) <- as.vector(header[1,])
  #Remove unused variables
  rm("file")
  rm("fileUrl")
  rm("header")
  #Open device
  png(filename = "plot4.png", width = 480, height = 480, units = "px")
  #Plot
  par(mfrow = c(2,2))
  #first graph
  plot(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  #second graph
  plot(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  #lines(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Global_active_power)
  #third graph
  plot(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, col = "red")
  lines(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, col = "blue")
  legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 5, lwd = 3, bty = "n")
  #fourth graph
  plot(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  #Close device
  dev.off()
  #Remove unused variables
  #rm("data")
}else{
  print(paste("File",file,"does not exists"))
}
print("<-- plot4.R")