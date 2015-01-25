#Cleaning Data - Week 1
#
#Question 5
#
#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() 
#from here: 
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 

#using the fread() command load the data into an R object
#DT 
#Which of the following is the fastest way to calculate the average value of the variable
#pwgtp15 
#broken down by sex using the data.table package?

#install.packages("data.table")
#library(data.table)
week1Question5 <- function() {
  
  downloadDate <- format(Sys.Date(), format="%d-%m-%Y")
  destfile <- paste(downloadDate, "pid.csv", sep = "-")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 

  if(!file.exists(destfile)) {    
    download.file(destfile = destfile, url=fileUrl, method = "curl")
  }
  
  DT <- fread(destfile)
  DT[,mean(pwgtp15)]
  #data <- read.csv(destfile);
}
