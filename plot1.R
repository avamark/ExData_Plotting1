#read data table
file.name="../data/household_power_consumption.txt"
data<- read.table(file.name,header=T,sep=";",na.strings="?")
# dtime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# names(dtime)<- "DateTime"
# get the needed subset
dt<- data.frame(dtf=as.Date(data$Date,"%d/%m/%Y"))
data<- data.frame(dt,data)
ds<- subset(data,data$dtf>="2007-01-01")
ds<- subset(ds,ds$dtf<"2007-02-02")
rm(data)
# 

hist(ds$Global_active_power,col="red",
     xlab="Global Active Power (Kilowatts)",
     main="Global Active Power"
     )
png(file = "plot1.png", bg = "transparent",width=480,height=480,units="px")
hist(ds$Global_active_power,col="red",
     xlab="Global Active Power (Kilowatts)",
     main="Global Active Power"
)
dev.off()