#Coursera Data Science course - Exploratory Data Analysis
#Electric Power Consumption
#Objective: Analysis of household energy usage variation during the period 2007-02-01 and 2007-02-02.

#The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
#Each column needs approximately eight bytes upon inspection.
#Approximate memory requirement is 2,075,259 X 9 X 8 = 149418648 bytes ~ 145MB

#First download the file to disk, if download succeeds then unzip it to a subfolder named data

#if (!file.exists("./data/household_power_consumption.txt")) {
#  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/exdata_data_household_power_consumption.zip", method
#                = "wget")
#  unzip("./data/exdata_data_household_power_consumption.zip", overwrite = T, exdir = "./data")
#}

#read the data....

curfile <- "I:\\course\\coursera\\set5\\exploratory_data_analysis\\hw\\data.txt"

data <- read.table(curfile, sep = ";", header = TRUE)

#convert into date format
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


#plot2
#scatterplot of Date against Global Active Power
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()