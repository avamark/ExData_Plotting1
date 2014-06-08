#read data table
file.name="../data/household_power_consumption.txt"
data<- read.table(file.name,header=T,sep=";",na.strings="?")
# dtime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# names(dtime)<- "DateTime"
# get the needed subset
dt<- data.frame(dtf=as.Date(data$Date,"%d/%m/%Y"))
data<- data.frame(dt,data)
ds<- subset(data,data$dtf>="2007-01-01")
rm(data)
ds<- subset(ds,ds$dtf<"2007-02-02")
wday<- data.frame(wday=weekdays(ds$dtf,T))
ds<- data.frame(wday=wday,ds)
ds[1]<- lapply(ds[1],as.factor)
#add dateTime column to ds
dtime<-strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")
ds<- data.frame(dtime=dtime,ds)
# 
#plot on screen
df<-ds[ds$dtf>"2007-01-10" & ds$dtf<"2007-01-13"
       ,c("dtime","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
with(df
     ,plot(dtime,Sub_metering_1
           ,type="l"
           ,ylab="Global Active Power (Kilowatts)"
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
#plot on png file
png(file = "plot3.png",,width=480,height=480,units="px")
with(df
     ,plot(dtime,Sub_metering_1
           ,type="l"
           ,ylab="Global Active Power (Kilowatts)"
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

dev.off()