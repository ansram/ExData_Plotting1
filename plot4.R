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

#plot 4
par(mfrow = c(2, 2))

# plot 1 (up left)
plot(data$Datetime, data$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

# plot 2 (up right)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", 
     xlab = "datetime")

# plot 3 (down left)
plot(data$Datetime, data$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "black")

points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", 
       ylab = "Sub_metering_2", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", 
       ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1",
                  "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (down right)
plot(data$Datetime, data$Global_reactive_power, type = "l", 
     xlab =  "datetime",
     ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.copy(png, file = "plot4.png")
dev.off()