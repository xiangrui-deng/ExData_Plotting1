# Read dataset and set "?" values as NA
df <- read.delim('household_power_consumption.txt',sep = ';',na.strings = c('?'))
# Remove NA values
df <- na.omit(df)
#Change the format of dates
df$Date <- as.Date(df$Date, '%d/%m/%Y' )
# Extract rows with two specific dates
df_selected <- df[which(df$Date >= "2007-02-01" & df$Date <= "2007-02-02"), ]

#save as a png file
png(filename = 'plot1.png')
#plot the first histogram
hist(df_selected$Global_active_power, col = 'red', main = 'Global Active Power'
     , xlab= 'Global Active Power (kilowatts)')
dev.off()

