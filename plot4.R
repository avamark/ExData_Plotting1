
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

############ DEFINE NEEDED FUNTIONS ##################
# define plot2png function
plot2png<- function(){
#plot on png file
df<-ds[,c("dtime","Sub_metering_1","Sub_metering_2"
          ,"Sub_metering_3","Voltage","Global_reactive_power")]
png(file = "plot4.png",,width=480,height=480,units="px")
par(mfrow=c(2,2))
#plot Active power
with(ds[,c("dtime","Global_active_power")]
     ,plot(dtime,Global_active_power,type="l"
           ,ylab="Global Active Power (Kilowatts)"
           ,xlab=""
     )
)
#Voltage
with(df
     ,plot(dtime,Voltage
           ,type="l"
           ,ylab="Voltage"
           ,xlab="datetime"
           #            ,xlim=as.POSIXct(c("2007-01-03","2007-01-07"))
     )
)
#plot Sub_metering
with(df
     ,plot(dtime,Sub_metering_1
           ,type="l"
           ,ylab="Energy Sub Metering"
           ,xlab=""
           #            ,xlim=as.POSIXct(c("2007-01-03","2007-01-07"))
     )
)
lines(df$dtime,df$Sub_metering_2,col="red")
lines(df$dtime,df$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue")
       ,lty=1,lwd=2
)
#Plot reactive power
with(ds[,c("dtime","Global_reactive_power")]
     ,plot(dtime,Global_reactive_power,type="l"
           #            ,ylab="Global Reactive Power (Kilowatts)"
           ,xlab="datetime"
     )
)

dev.off()
}
#----------------------------------------------------------------
#define plot2screen function
plot2screen<- function(){
#plot on screen
df<-ds[,c("dtime","Sub_metering_1","Sub_metering_2"
          ,"Sub_metering_3","Voltage","Global_reactive_power")]
par(mfrow=c(2,2))
#plot Active power
with(ds[,c("dtime","Global_active_power")]
     ,plot(dtime,Global_active_power,type="l"
           ,ylab="Global Active Power (Kilowatts)"
           ,xlab=""
     )
)
#Voltage
with(df
     ,plot(dtime,Voltage
           ,type="l"
           ,ylab="Voltage"
           ,xlab="datetime"
           #            ,xlim=as.POSIXct(c("2007-01-03","2007-01-07"))
     )
)

#plot Sub_metering
with(df
     ,plot(dtime,Sub_metering_1
           ,type="l"
           ,ylab="Energy Sub Metering"
           ,xlab=""
           #            ,xlim=as.POSIXct(c("2007-01-03","2007-01-07"))
     )
)
lines(df$dtime,df$Sub_metering_2,col="red")
lines(df$dtime,df$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue")
       ,lty=1,lwd=2
)
#Plot reactive power
with(ds[,c("dtime","Global_reactive_power")]
     ,plot(dtime,Global_reactive_power,type="l"
           #            ,ylab="Global Reactive Power (Kilowatts)"
           ,xlab="datetime"
     )
)
}
#========== PROGRAM TO RUN =================================
#set file.name containing data

#read data
readData(file.name)
#plot to png file
plot2png()
#plot to screen if you want to
#uncoment next line to plot on screen
# plot2screen()
