# Read dataset and set "?" values as NA
df <- read.delim('household_power_consumption.txt',sep = ';',na.strings = c('?'))
# Remove NA values
df <- na.omit(df)
#Change the format of dates
df$Date <- as.Date(df$Date, '%d/%m/%Y' )
# Extract rows with two specific dates
df_selected <- df[which(df$Date >= "2007-02-01" & df$Date <= "2007-02-02"), ]

plot.new()


# first line plot
plot(x =df_selected$dateTime, y=df_selected$Sub_metering_1, type = 'l', 
     xlab = '', ylab = 'Energy sub metering')

#second line plot
lines(x =df_selected$dateTime, y=df_selected$Sub_metering_2, col = 'red')

#third line plot
lines(x =df_selected$dateTime, y=df_selected$Sub_metering_3, col = 'blue')

#Add a legend to the plot
legend('topright', col = c('black','red','blue'),
       c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'),
       lwd = c(1,1))
