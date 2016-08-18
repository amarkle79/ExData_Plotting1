# Read only data from the two specified days
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt", skip=grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt"))[1]-1, nrows=length(grep("^1/2/2007|^2/2/2007", readLines("household_power_consumption.txt"))), sep=";")
colnames(df) <- header

# Construct plot
plot(df$Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering")
axis(1, at=seq(0,nrow(df),nrow(df)/2), labels=c("Thu", "Fri", "Sat"))
lines(df$Sub_metering_2, col="red")
lines(df$Sub_metering_3, col="blue")
legend("topright", legend=colnames(df)[7:9], col=c("black", "red", "blue"), lty="solid")

# Save plot to file
dev.copy(png,'plot3.png')
dev.off()