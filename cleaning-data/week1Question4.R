#Cleaning Data - Week 1
#
#Question 4
#
#Read the XML data on Baltimore restaurants from here: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
#How many restaurants have zipcode 21231? 

#install.packages("XML")
#library(XML)
week1Question4 <- function() {
  
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  downloadDate <- format(Sys.Date(), format="%d-%m-%Y")
  destfile <- paste(downloadDate, "restaurantes.xml", sep = "-")

  download.file(destfile = destfile, url=fileUrl, method = "curl")
  doc <- xmlTreeParse(file = destfile, useInternalNodes = TRUE)
  
  rootDoc <- xmlRoot(doc)
  
  zips <- xpathSApply(rootDoc, "//zipcode", xmlValue)
  zipsWith21231 <- zips[zips == 21231]
  length(zipsWith21231)
  #names(rootDoc)
}
