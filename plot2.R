data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 

               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")



## Subsetting the data

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)



## Converting dates

data_conv <- paste(as.Date(data_sub$Date), data_sub$Time)

data_sub$Datetime <- as.POSIXct(data_conv)



## Plot 2

plot(data_sub$Global_active_power~data_sub$Datetime, type="l",

     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="./plot2.png", height=480, width=480)

dev.off()
