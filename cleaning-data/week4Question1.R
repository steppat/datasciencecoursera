#Week 4 Question 1

#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using 
#download.file() from here: 

#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

#and load the data into R. The code book, describing the variable names is here: 

#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

#Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
#What is the value of the 123 element of the resulting list?

week4Question1 = function() {
  
  dir = createDataDir()
  path = downloadFile(dir)
  
  df = read.csv(path)
  
  #strsplit devolve uma lista
  names = names(df)
  strsplit(names,"wgtp")[123]
}

createDataDir = function() {
  dataDir = "./data"
  
  if(!file.exists(dataDir)) {
    print("creating dir data")
    dir.create(dataDir)
  }
  
  dataDir
}

downloadFile = function(dir) {
  url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  downloadDate = format(Sys.Date(), format="%d-%m-%Y")
  destfile = paste(downloadDate, "communities.csv", sep = "-")
  path = paste(dir, destfile, sep = "/")
  
  if(!file.exists(path)) {
    download.file(destfile = path, url=url, method = "curl")
  } 
  
  path
}