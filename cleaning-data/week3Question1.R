#Question 1
#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() 
#from here: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

#and load the data into R. The code book, describing the variable names is here: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

#Create a logical vector that identifies the households on greater than 10 acres ($ACR == 3)
#who sold more than $10,000 worth of agriculture products ($AGS==6). Assign that logical 
#vector to the variable agricultureLogical. Apply the which() function like this to 
#identify the rows of the data frame where the logical vector is TRUE. 
#which(agricultureLogical) What are the first 3 values that result?

week3Question1 = function() {
  
  dataDir = "./data"
  
  if(!file.exists(dataDir)) {
    dir.create(dataDir)
  }
  
  downloadDate = format(Sys.Date(), format="%d-%m-%Y")
  destfile = paste(downloadDate, "housing.csv", sep = "-")
  path = paste(dataDir, destfile, sep = "/")
  #print(path)
  
  if(!file.exists(path)) {
    fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(destfile = path, url=fileUrl, method = "curl")
  } 
  
  df = read.csv(path)
  which(df$ACR==3 & df$AGS==6)[1:3] #escolhe os primeiros 3
}