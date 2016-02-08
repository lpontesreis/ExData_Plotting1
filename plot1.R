#Plots first png chart in R

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

#creates first plot and adjusts font to 0.8
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex.lab=0.8, cex.axis=0.8, cex.main=0.8)

#copy to png
dev.copy(png, file = "plot1.png") 

#close dev
dev.off()