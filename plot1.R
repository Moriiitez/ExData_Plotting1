source("read_data.R")

hist(t_final$Global_active_power , col = "red",
     main = "Global Acctive Power" , 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()