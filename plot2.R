source("read_data.R")

plot(t_final$Global_active_power~t_final$dateTime, type = "l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()