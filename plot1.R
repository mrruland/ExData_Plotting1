library(dplyr)

# read in only the data for 2/1/2007 and 2/2/2007 
   df <- read.csv2("household_power_consumption.txt", header=TRUE,stringsAsFactors=FALSE,na.strings="?") %>% 
        filter(Date == "1/2/2007" | Date =="2/2/2007") 
# build datetime column
   df$Datetime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %T")
# convert data types
   df$Global_active_power   <- as.numeric(df$Global_active_power)
   df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
   df$Voltage               <- as.numeric(df$Voltage)
   df$Global_intensity      <- as.numeric(df$Global_intensity)
   df$Sub_metering_1        <- as.numeric(df$Sub_metering_1)
   df$Sub_metering_2        <- as.numeric(df$Sub_metering_2)
   df$Sub_metering_3        <- as.numeric(df$Sub_metering_3)

#generate plot 1
png("plot1.png",width=480,height=480)
hist(df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",  
     ylim=c(0,1200), xlim=c(0,7.5))
dev.off()