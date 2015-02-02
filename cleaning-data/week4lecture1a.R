
#week4 video 1 First Part

toUpperToLowerExample = function() {
  
  dataDir = "./data"
  
  if(!file.exists(dataDir)) {
    print("creating dir data")
    dir.create(dataDir)
  }
  
  url = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
  downloadDate = format(Sys.Date(), format="%d-%m-%Y")
  destfile = paste(downloadDate, "baltimore-camera.csv", sep = "-")
  path = paste(dataDir, destfile, sep = "/")
  
  if(!file.exists(path)) {
    download.file(destfile = path, url=url, method = "curl")
  } 

  cameraData = read.csv(path)
  
  colNames = names(cameraData)
  lowNames = tolower(names(cameraData))
  splitNames = strsplit(lowNames,"\\.") #é uma lista
  semPontoNames = sapply(splitNames, function(x) {x[1]})
  
  print("Original : ")
  print(colNames)
  print("Lower    : ")
  print(lowNames)
  print("Sem ponto: ")
  print(semPontoNames)
  
  print("Alameda in intersection: ")
  print(grep("Alameda" , cameraData$intersection))
  #grepl("Alameda", cameraData$intersection)
  
  #select only rows where alameda dois nos appears in intersection
  #df2 = df[!grepl("Alameda", df$intersection),]
  
  cameraData
}