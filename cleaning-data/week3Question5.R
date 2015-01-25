#Question 4

#Load the Gross Domestic Product data for the 190 ranked 
#countries in this data set: 

#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

#Load the educational data from this data set: 

#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

#Cut the GDP ranking into 5 separate quantile groups. Make a table 
#versus Income.Group.
#How many countries are Lower middle 
#income but among the 38 nations with highest GDP?

#Original data sources: 
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats


#install.packges("dplyr")
#library(dplyr)
#library(Hmisc)
week3Question5 = function() {
  
  library(dplyr)
  library(Hmisc)
  
  gdpFileName = "gdp.csv"
  gdpFileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  gdpDf = downloadAndReadCsv(gdpFileName,gdpFileUrl)
  
  #print(dim(gdpDf))
  gdpDf = gdpDf[!(is.na(gdpDf$X) | gdpDf$X==""), ] #gdpDf[complete.cases(gdpDf$X),]
  #print(dim(gdpDf))
  
  eduFileName = "edu.csv"
  eduFileUrl = "https://d396qusza40orc.cloudfront.nnet/getdata%2Fdata%2FEDSTATS_Country.csv"
  eduDf = downloadAndReadCsv(eduFileName,eduFileUrl)
  
  
  #print(dim(eduDf))
  eduDf = eduDf[!(is.na(eduDf$CountryCode) | eduDf$CountryCode==""), ]  
  #print(dim(eduDf))
  
  mergedDf = merge(gdpDf, eduDf,by.x = "X", by.y = "CountryCode")
  mergedDf = rename(mergedDf, CountryCode = X, GDP = Gross.domestic.product.2012, CountryName = X.2)
  
  #print(names(mergedDf))
  
  #print(dim(mergedDf))
  mergedDf = mergedDf[!(is.na(mergedDf$GDP) | mergedDf$GDP==""), ] 
  #print(dim(mergedDf))
  
  mergedDf = mutate(mergedDf, GDPN = as.numeric(as.character(GDP)))
  mergedDf = arrange(mergedDf, GDPN)
  
  mergedDf$groups = cut2(mergedDf$GDPN, g=5)
  table(mergedDf$groups, mergedDf$Income.Group)
}


#helper function
downloadAndReadCsv = function(fileName, url) {
  
  dataDir = "./data"
  
  if(!file.exists(dataDir)) {
    dir.create(dataDir)
  }
  
  downloadDate = format(Sys.Date(), format="%d-%m-%Y")
  destfile = paste(downloadDate, fileName, sep = "-")
  path = paste(dataDir, destfile, sep = "/")
  
  #print(path)
  
  if(!file.exists(path)) {
    download.file(destfile = path, url=url, method = "curl")
  } 
  
  df = read.csv(path)
  df
}