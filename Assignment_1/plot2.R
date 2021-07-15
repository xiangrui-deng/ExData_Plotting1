# Read dataset and set "?" values as NA
df <- read.delim('household_power_consumption.txt',sep = ';',na.strings = c('?'))
# Remove NA values
df <- na.omit(df)
#Change the format of dates
df$Date <- as.Date(df$Date, '%d/%m/%Y' )
# Extract rows with two specific dates
df_selected <- df[which(df$Date >= "2007-02-01" & df$Date <= "2007-02-02"), ]
# Combine date and time together 
df_selected$dateTime <- as.POSIXct(paste(df_selected$Date, df_selected$Time), '%d/%m/%Y %H:%M:%S')

plot.new()

# Create the line plot
plot(x = df_selected$dateTime, y = df_selected$Global_active_power, type= 'l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')
