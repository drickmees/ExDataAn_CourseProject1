# ExData_Plotting1 - Coursera - Plot 4

#Reading data...
datos=read.csv('./data/household_power_consumption.txt',header=T, sep=';')

# "You may find it useful to convert the Date and Time variables to Date/Time classes in R using the  strptime() and as.Date() functions" From instructions
datos$Datetime = paste(as.character(datos[,1]) , datos[,2])
datos[,1]=as.Date(datos$Date,'%d/%m/%Y')

# Subsetting "We will only be using data from the dates 2007-02-01 and 2007-02-02" from instructions
datos = subset(datos, Date == '2007-02-01' | Date == '2007-02-02')

# Convert from text to number
datos[,3] = as.numeric(as.character(datos[,3]))
datos$Sub_metering_1 <- (as.numeric(as.character(datos$Sub_metering_1))) 
datos$Sub_metering_2 <- (as.numeric(as.character(datos$Sub_metering_2)))
datos$Sub_metering_3 <- (as.numeric(as.character(datos$Sub_metering_3)))
datos$Voltage <- (as.numeric(as.character(datos$Voltage)))
datos$Global_reactive_power <- (as.numeric(as.character(datos$Global_reactive_power)))

# The datetime object
datos$dates <- strptime(datos$Datetime, '%d/%m/%Y %H:%M') 

#Making plot 4 and saving as png in the directory
par(mfrow=c(2,2), cex=0.75)
plot(datos$dates,datos$Global_active_power,ylab='Global Active Power',xlab='',type='line')
plot(datos$dates,datos$Voltage,ylab='Voltage',xlab='datetime',type='line')
plot(datos$dates,datos$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(datos$dates,datos$Sub_metering_2,col='red')
lines(datos$dates,datos$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1      ','Sub_metering_2      ','Sub_metering_3      '), col=c('black','red','blue'), bty="n",lty=1,lwd=1.5,xjust=1,y.intersp=0.6)
plot(datos$dates,datos$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='line')
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()