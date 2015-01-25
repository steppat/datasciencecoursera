#Cleaning Data - Week 1
#
#Question 1
#
#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() 
#from here:   
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
#and load the data into R. The code book, describing the variable names is here:   

#How many properties are worth $1,000,000 or more?
week1Question1 <- function() {
  download.file(destfile = "housing.csv",url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", method = "curl")
  data <- read.csv("housing.csv")
  values <- data$VAL
  valuesSemNa <- values[!is.na(values)]
  # property 24 é mais de um millhao
  length(valuesSemNa[valuesSemNa == 24])
}