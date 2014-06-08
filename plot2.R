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
with(ds[ds$dtf>"2007-01-03" & ds$dtf<"2007-01-06"
        ,c("dtime","Global_active_power")]
     ,plot(dtime,Global_active_power,type="l"
           ,ylab="Global Active Power (Kilowatts)"
           ,xlab=""
           )
    )
#plot on png file
png(file = "plot2.png",,width=480,height=480,units="px")
with(ds[ds$dtf>"2007-01-03" & ds$dtf<"2007-01-06"
        ,c("dtime","Global_active_power")]
     ,plot(dtime,Global_active_power,type="l"
           ,ylab="Global Active Power (Kilowatts)"
           ,xlab=""
           )
     )

dev.off()