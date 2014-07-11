#read data table
file.name="../data/household_power_consumption.txt"
data<- read.table(file.name,header=T,sep=";",na.strings="?")
# get the needed subset
dt<-as.Date(data$Date,format="%d/%m/%Y")
day1<- as.Date(dt) == "2007-02-01"
day2<- as.Date(dt) == "2007-02-02"
ds<- data[day1|day2,]
rm(data)
# 
# uncoment next statement to see the plot on screen too
# hist(ds$Global_active_power,col="red",
#      xlab="Global Active Power (Kilowatts)",
#      main="Global Active Power"
#      )

png(file = "plot1.png", ,width=480,height=480,units="px")
hist(ds$Global_active_power,col="red",
     xlab="Global Active Power (Kilowatts)",
     main="Global Active Power"
    )
dev.off()
