#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week1")
#Reading the Data File in R
my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)
#Extracting the data having the dates between 2007-02-01 and 2007-02-02
my_data_subset <- my_data[(as.Date(my_data$Date,"%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d") 
                          & as.Date(my_data$Date,"%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d")),]

#Creating a png file to store the graph
png("plot2.png", width=480, height=480)
#Plotting the required Graph
with (my_data_subset, plot(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
                           as.numeric(Global_active_power),
                           type = 'l', main = "", 
                           xlab = "",ylab = "Global Active Power (kilowatts)"))

dev.off()