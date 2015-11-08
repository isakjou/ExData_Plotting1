print("plot1.R -->")
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
  png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
  #Plot
  hist(data$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")
  #Close device
  dev.off()
}else{
  print(paste("File",file,"does not exists"))
}
print("<-- plot1.R")