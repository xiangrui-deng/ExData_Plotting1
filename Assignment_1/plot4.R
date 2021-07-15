# Read dataset and set "?" values as NA
df <- read.delim('household_power_consumption.txt',sep = ';',na.strings = c('?'))
# Remove NA values
df <- na.omit(df)
#Change the format of dates
df$Date <- as.Date(df$Date, '%d/%m/%Y' )
# Extract rows with two specific dates
df_selected <- df[which(df$Date >= "2007-02-01" & df$Date <= "2007-02-02"), ]

plot.new()

#Set the position of four plots
par(mfrow = c(2,2))

#plot1
plot(x = df_selected$dateTime, y = df_selected$Global_active_power, type= 'l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')

#plot2
plot(x = df_selected$dateTime, y = df_selected$Voltage, type= 'l',
     xlab = 'datetime', ylab = 'Voltage')


#plot3
plot(x =df_selected$dateTime, y=df_selected$Sub_metering_1, type = 'l', 
     xlab = '', ylab = 'Energy sub metering')
lines(x =df_selected$dateTime, y=df_selected$Sub_metering_2, col = 'red')
lines(x =df_selected$dateTime, y=df_selected$Sub_metering_3, col = 'blue')
legend('topright', col = c('black','red','blue'),
       c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'),
       lwd = c(1,1))

#plot4
plot(x =df_selected$dateTime, y=df_selected$Global_reactive_power, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')
