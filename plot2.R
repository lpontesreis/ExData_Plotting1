#plots the second chart

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
y <- df$Global_active_power
plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.7, cex.axis = 0.7)

#copy to png
dev.copy(png, file = "plot2.png") 

#close dev
dev.off()
