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
df<-ds[ ,c("dtime","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
# with(df
#      ,plot(dtime,Sub_metering_1
#            ,type="l"
#            ,ylab="Energy sub metering"
#            ,xlab=""
# #            ,xlim=as.POSIXct(c("2007-01-03","2007-01-07"))
#            )
#     )
# lines(df$dtime,df$Sub_metering_2,col="red")
# lines(df$dtime,df$Sub_metering_3,col="blue")
# legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
#        ,col=c("black","red","blue")
#        ,lty=1,lwd=2
#       )
#plot on png file
png(file = "plot3.png",,width=480,height=480,units="px")
with(df
     ,plot(dtime,Sub_metering_1
           ,type="l"
           ,ylab="Energy sub metering"
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