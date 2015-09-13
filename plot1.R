# ExData_Plotting1 - Coursera - Plot 1

#Reading data...
datos=read.csv('./data/household_power_consumption.txt',header=T, sep=';')

# "You may find it useful to convert the Date and Time variables to Date/Time classes in R using the  strptime() and as.Date() functions" From instructions
datos$Datetime = paste(as.character(datos[,1]) , datos[,2])  
datos[,1]=as.Date(datos$Date,'%d/%m/%Y') 

# Subsetting "We will only be using data from the dates 2007-02-01 and 2007-02-02" from instructions
datos = subset(datos, Date == '2007-02-01' | Date == '2007-02-02') 

# Convert from text to number
datos[,3] = as.numeric(as.character(datos[,3])) 

# Making plot 1 and saving as png in the directory
png('plot1.png',width=480,height=480)
hist(datos[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()
