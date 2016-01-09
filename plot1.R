path<-getwd()
setwd(path)

consumption_data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",nrows = 100000)

consumption_data$DT<-paste(as.Date(consumption_data$Date,format = "%d/%m/%Y"),consumption_data$Time,sep = ' ')
        
consumption_data$DT<-strptime(consumption_data$DT,format = "%Y-%m-%d %H:%M:%S")

lower_bound<-"2007-01-31 23:59:00"
upper_bound<-"2007-02-03 0:00:00"

lower_bound<-strptime(lower_bound,format = "%Y-%m-%d %H:%M:%S")
upper_bound<-strptime(upper_bound,format = "%Y-%m-%d %H:%M:%S")

consumption_data<-subset(consumption_data,DT>lower_bound)
consumption_data<-subset(consumption_data,DT<upper_bound)

png(file= "plot1.png",width = 480, height = 480)
hist(consumption_data$Global_active_power,col='red',main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()


