#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week1")
#Reading the Data File in R
my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)
#Extracting the data having the dates between 2007-02-01 and 2007-02-02
my_data_subset <- my_data[(as.Date(my_data$Date,"%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d") 
                          & as.Date(my_data$Date,"%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d")),]

#Creating a png file to store the graph
png("plot4.png", width=480, height=480)
#Seting 2 Rows and 2 Columns in the file for 4 Graphs
par(mfrow = c(2, 2))
#Plotting the required Graphs
#Plotting Graph 1
with (my_data_subset, plot(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
                           as.numeric(Global_active_power),
                           type = 'l', main = "", 
                           xlab = "",ylab = "Global Active Power"))

#Plotting Graph 2
with (my_data_subset, plot(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
                           as.numeric(Voltage),
                           type = 'l', main = "", 
                           xlab = "datetime",ylab = "Voltage"))

#Plotting Graph 3
with (my_data_subset, plot(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
                           as.numeric(Sub_metering_1),
                           type = 'l', main = "", 
                           xlab = "",ylab = "Energy sub metering"))
with(my_data_subset, lines(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
                           as.numeric(Sub_metering_2),col = "red"))
with(my_data_subset, lines(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
                           as.numeric(Sub_metering_3),col = "blue"))
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),lty=1, lwd=1)    

#Plotting Graph 4
with (my_data_subset, plot(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
                           as.numeric(Global_reactive_power),
                           type = 'l', main = "", 
                           xlab = "datetime",ylab = "Global_reactive_power"))

dev.off()