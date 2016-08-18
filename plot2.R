# Read only data from the two specified days
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt", skip=grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt"))[1]-1, nrows=length(grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt"))), sep=";")
colnames(df) <- header

# Construct plot
plot(df$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=seq(0,nrow(df),nrow(df)/2), labels=c("Thu", "Fri", "Sat"))

# Save plot to file
dev.copy(png,'plot2.png')
dev.off()