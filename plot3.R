#plots the third chart

#####################################################################################################
# the code below is unnecessary if you already have uploaded the dataframe to the working directoryr
#####################################################################################################

#assuming dataset is in working directory
df <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#converts first column to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

#subset to the dates 2007-02-01 and 2007-02-02
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

df <- df[df$Date >= date1 & df$Date <= date2,]

#converts first column to date and second column to time
df <- within(df, {timestamp = format(as.POSIXct(paste(Date, Time)), "%d-%m-%Y %H:%M:%S")})
df$timestamp <- as.POSIXct(df$timestamp, format = "%d-%m-%Y %H:%M:%S")

#converts first column to date and second column to time
df <- within(df, {timestamp = format(as.POSIXct(paste(Date, Time)), "%d-%m-%Y %H:%M:%S")})
df$timestamp <- as.POSIXct(df$timestamp, format = "%d-%m-%Y %H:%M:%S")

########################################################################################################
#this is the only new part from the previous code ######################################################
########################################################################################################

x <- df$timestamp

#open png file

png(file = "plot3.png", width = 480, height = 480)

plot(x, df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", cex.lab = 0.8, cex.axis = 0.8)
lines(x, df$Sub_metering_2, type = "l", col = "red")
lines(x, df$Sub_metering_3, type = "l", col = "blue")

#include legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8, lty = c(1,1,1), col = c("black", "red", "blue"))

#close dev
dev.off()
