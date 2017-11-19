# This code makes plot3 required for the assignement of week 1
# The zipped file is suposed to be in the working directory

#Initialization of the name of the files
zipped_hpc_file <- "exdata_data_household_power_consumption.zip"
hpc_file <- "household_power_consumption.txt"
# This code makes plot1 required for the assignement of week 2
#Unzip the zip file if the unzipped one is not present in the working directory
if (!file.exists(hpc_file)) {
  unzip(zipped_hpc_file)
}

#Read the names of the variables
header <- read.table(hpc_file,nrows=1,sep=";",header=TRUE)
#Number of rows that have to be read
nrdata=69519-66638;
#Read only the rows that we are interested in 
hpc <- read.table(hpc_file, skip=66637,nrows=nrdata,sep=";")
#Attribute names to the columns of the hpc data frame
colnames(hpc) <- colnames(header) 

#Make and save plot3
png(file="plot3.png",width = 480, height = 480)
plot(hpc$Sub_metering_1,xaxt="n",ylab="Energy sub metering",type="l",xlab="",col="black")
lines(hpc$Sub_metering_2,xaxt="n",ylab="",type="l",xlab="",col="red")
lines(hpc$Sub_metering_3,xaxt="n",ylab="",type="l",xlab="",col="blue")
axis(side=1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
legend("topright", lty=c(1,1),col = c("black","red", "blue"), legend = c("Sub_metering1","Sub_metering2", "Sub_metering3"),cex=0.75)
dev.off()