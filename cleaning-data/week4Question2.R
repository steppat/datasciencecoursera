#Week 4 Question 2

#Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

#Remove the commas from the GDP numbers in millions of dollars and average them. 
#What is the average? 

#Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table

week4Question2 = function() {
  
  dir = createDataDir()
  path = downloadFile(dir)

  df = read.csv(path)
  #print(df)
  lista = sapply(df$X.3[5:195], function(v) { 
    as.numeric(gsub(",","", v)) 
  })
  mean(lista,na.rm = TRUE)
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