#Cleaning Data - Week 1 
#
#Question 3
#
#Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
  
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 

#Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:  
#dat 
#What is the value of:
#  sum(dat$Zip*dat$Ext,na.rm=T) 

#install.packages("xlsx")
#library(xlsx)
week1Question3 <- function() {
  
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  downloadDate <- format(Sys.Date(), format="%d-%m-%Y")
  destfile <- paste(downloadDate, "gas.xlsx" ,sep = "-")
  colIndex <- 7:15
  rowIndex <- 18:23
  
  download.file(destfile = destfile, url=fileUrl, method = "curl")
  dat <- read.xlsx(sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex, destfile)
  sum(dat$Zip*dat$Ext,na.rm=T)
}
