#Question 2
#Using the jpeg package read in the following picture of your instructor into R 

#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 

#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the 
#resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)

#install.packages("jpeg")
week3Question2 = function() {
  
  library("jpeg")
  dataDir = "./data"
  
  if(!file.exists(dataDir)) {
    dir.create(dataDir)
  }
  
  downloadDate = format(Sys.Date(), format="%d-%m-%Y")
  destfile = paste(downloadDate, "jeff.jpeg", sep = "-")
  path = paste(dataDir, destfile, sep = "/")
  #print(path)
  
  if(!file.exists(path)) {
    fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    download.file(destfile = path, url=fileUrl, method = "curl")
  } 
  image = readJPEG(source = path, native = TRUE)
  quantile(image, probs = c(0.3,0.8)) #30% e 80%
  }