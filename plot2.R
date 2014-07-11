#read data table
file.name="../data/household_power_consumption.txt"
data<- read.table(file.name,header=T,sep=";",na.strings="?")
# get the needed subset
dt<-as.Date(data$Date,format="%d/%m/%Y")
day1<- as.Date(dt) == "2007-02-01"
day2<- as.Date(dt) == "2007-02-02"
ds<- data[day1|day2,]
#add dateTime column to ds
ds$dtime<-strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")
# 
#uncoment to plot on screen
# with(ds[,c("dtime","Global_active_power")]
#      ,plot(dtime,Global_active_power,type="l"
#            ,ylab="Global Active Power (Kilowatts)"
#            ,xlab=""
#            )
#     )
#plot on png file
png(file = "plot2.png",,width=480,height=480,units="px")
with(ds[,c("dtime","Global_active_power")]
     ,plot(dtime,Global_active_power,type="l"
           ,ylab="Global Active Power (Kilowatts)"
           ,xlab=""
           )
     )

dev.off()