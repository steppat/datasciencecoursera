#Week 4 Question 4

#Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

#Load the educational data from this data set: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

#Match the data based on the country shortcode. Of the countries for which the 
#end of the fiscal year is available, how many end in June? 

#Original data sources: 
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats

week4Question4 = function() {
  
  url1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  url2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  
  dir = createDataDir()
  
  path1 = downloadFile(dir, url1, "gdp.csv")
  path2 = downloadFile(dir, url2, "country.csv")
  
  gdpDf = read.csv(path1)
  countryDf = read.csv(path2)

  #length(grep("^United",df$X.2))
  mergedDf = merge(gdpDf, countryDf,by.x = "X", by.y = "CountryCode",all=TRUE)
  table(grepl(".*Fiscal year end.*June.*", mergedDf$Special.Notes))
}

createDataDir = function() {
  dataDir = "./data"
  
  if(!file.exists(dataDir)) {
    print("creating dir data")
    dir.create(dataDir)
  }
  
  dataDir
}

downloadFile = function(dir, url, name) {
  downloadDate = format(Sys.Date(), format="%d-%m-%Y")
  destfile = paste(downloadDate, name, sep = "-")
  path = paste(dir, destfile, sep = "/")
  
  if(!file.exists(path)) {
    download.file(destfile = path, url=url, method = "curl")
  } 
  
  path
}