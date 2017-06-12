#Setting the Working Directory
setwd("C:/Users/User/Desktop/Coursera Data/Course 4/Week1")
#Reading the Data File in R
my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)
#Extracting the data having the dates between 2007-02-01 and 2007-02-02
my_data_subset <- my_data[(as.Date(my_data$Date,"%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d") 
                          & as.Date(my_data$Date,"%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d")),]

#Creating a png File to store the graph
png("plot1.png", width=480, height=480)
#Plotting the Graph
hist(as.numeric(my_data_subset$Global_active_power),main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)",col = "red")

dev.off()