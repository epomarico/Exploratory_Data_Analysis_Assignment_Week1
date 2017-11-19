# This code makes plot2 required for the assignement of week 1
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

#Make and save plot2
png(file="plot2.png",width = 480, height = 480)
plot(hpc$Global_active_power,xaxt="n",ylab="Global active power (kilowatts)",type="l",xlab="")
axis(side=1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
dev.off()