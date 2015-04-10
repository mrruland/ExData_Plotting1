library(dplyr)

# read in only the data for 2/1/2007 and 2/2/2007 
   df <- read.csv2("household_power_consumption.txt", header=TRUE,stringsAsFactors=FALSE,na.strings="?") %>% 
        filter(Date == "1/2/2007" | Date =="2/2/2007") 
# build datetime column
   df$Datetime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %T")
# convert data types to numeric
   df$Global_active_power   <- as.numeric(df$Global_active_power)
   df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
   df$Voltage               <- as.numeric(df$Voltage)
   df$Global_intensity      <- as.numeric(df$Global_intensity)
   df$Sub_metering_1        <- as.numeric(df$Sub_metering_1)
   df$Sub_metering_2        <- as.numeric(df$Sub_metering_2)
   df$Sub_metering_3        <- as.numeric(df$Sub_metering_3)

#generate plot 4
png("plot4.png",width=480,height=480)
  par(mfrow=c(2,2))
#generate upper left plot
  plot(df$Datetime,df$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#generate upper right plot
  plot(df$Datetime,df$Voltage,type="l",ylab="Voltage",xlab="datetime")
#generate lower left plot
  plot(df$Datetime,df$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  lines(df$Datetime,df$Sub_metering_1,type="l",lty=1, col="black")
  lines(df$Datetime,df$Sub_metering_2,type="l",lty=1, col="red")
  lines(df$Datetime,df$Sub_metering_3,type="l",lty=1, col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"),bty="n")
#generate lower right plot
  plot(df$Datetime,df$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()