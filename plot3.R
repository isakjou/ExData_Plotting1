print("plot3.R -->")
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
  png(filename = "plot3.png", width = 480, height = 480, units = "px", res = 96)
  #Plot
  plot(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Sub_metering_1)
  lines(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, col = "red")
  lines(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, col = "blue")
  legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 5, lwd = 3)
  #Close device
  dev.off()
  #Remove unused variables
  #rm("data")
}else{
  print(paste("File",file,"does not exists"))
}
print("<-- plot3.R")