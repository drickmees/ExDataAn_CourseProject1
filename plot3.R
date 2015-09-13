# ExData_Plotting1 - Coursera - Plot 3

#Reading data...
datos=read.csv('./data/household_power_consumption.txt',header=T, sep=';') 

# "You may find it useful to convert the Date and Time variables to Date/Time classes in R using the  strptime() and as.Date() functions" From instructions
datos$Datetime = paste(as.character(datos[,1]) , datos[,2])  
datos[,1]=as.Date(datos$Date,'%d/%m/%Y') 

# Subsetting "We will only be using data from the dates 2007-02-01 and 2007-02-02" from instructions
datos = subset(datos, Date == '2007-02-01' | Date == '2007-02-02') #select only the two required days

# Convert from text to number
datos[,3] = as.numeric(as.character(datos[,3])) # convert the Global Active Power's datatype from text (interpreted as factors, hence the as.character) to numbers
datos$Sub_metering_1 <- (as.numeric(as.character(datos$Sub_metering_1)))
datos$Sub_metering_2 <- (as.numeric(as.character(datos$Sub_metering_2)))
datos$Sub_metering_3 <- (as.numeric(as.character(datos$Sub_metering_3)))

# The datetime object 
datos$dates <- strptime(datos$Datetime, '%d/%m/%Y %H:%M') 

#Making plot 3 and saving as png in the directory
png('plot3.png',width=480,height=480)
plot(datos$dates,datos$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(datos$dates,datos$Sub_metering_2,col='red')
lines(datos$dates,datos$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1,lwd=1.5)
dev.off()