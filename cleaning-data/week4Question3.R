#Week 4 Question 3

#In the data set from Question 2 what is a regular expression 
#that would allow you to count the number of countries 
#whose name begins with "United"?

#Assume that the variable with the country names in it is 
#named countryNames. 
#How many countries begin with United?

week4Question3 = function() {
  
  dir = createDataDir()
  path = downloadFile(dir)
  
  df = read.csv(path)
  length(grep("^United",df$X.2))
  
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
  url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  downloadDate = format(Sys.Date(), format="%d-%m-%Y")
  destfile = paste(downloadDate, "gdp.csv", sep = "-")
  path = paste(dir, destfile, sep = "/")
  
  if(!file.exists(path)) {
    download.file(destfile = path, url=url, method = "curl")
  } 
  
  path
}