#Question 4

#Load the Gross Domestic Product data for the 190 ranked 
#countries in this data set: 

#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

#Load the educational data from this data set: 

#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

#What is the average GDP ranking for the "High income: OECD" 
#and "High income: nonOECD" group?

#Original data sources: 
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats


#install.packges("dplyr")
#library(dplyr)
week3Question4 = function() {
  
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
  mergedDf = arrange(mergedDf, desc(GDPN))
  #print(names(mergedDf))
  
  highOECD = filter(mergedDf, Income.Group == "High income: OECD")
  highNonOECD = filter(mergedDf, Income.Group == "High income: nonOECD")
  
  avgHighOECD = mean(highOECD$GDPN)
  avgHighNonOECD = mean(highNonOECD$GDPN)
            
  c(avgHighOECD,avgHighNonOECD)
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