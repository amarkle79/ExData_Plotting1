# Read only data from the two specified days
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt", skip=grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt"))[1]-1, nrows=length(grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt"))), sep=";")
colnames(df) <- header

# Construct plot
hist(df$Global_active_power, breaks=seq(0,10,.5), xlim=c(0,7), col="red", axes=FALSE, xlab="Global Active Power (kilowatts)", main="Global Active Power")
axis(1, at=seq(0,6,2), labels=seq(0,6,2))
axis(2, at=seq(0,1200,200), labels=seq(0,1200,200))

# Save plot to file
dev.copy(png,'plot1.png')
dev.off()