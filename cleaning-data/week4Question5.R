#Week 4 Question 5

#You can use the quantmod (http://www.quantmod.com/) package to get historical 
#stock prices for publicly traded companies on the NASDAQ and NYSE. 
#Use the following code to download data on Amazon's stock price and 
#get the times the data was sampled.

#library(quantmod)
#amzn = getSymbols("AMZN",auto.assign=FALSE)
#sampleTimes = index(amzn) 

#How many values were collected in 2012? 
#How many values were collected on Mondays in 2012?

#install.packages("quantmod")
week4Question5 = function() {
  
  library(quantmod)
  amzn = getSymbols("AMZN",auto.assign=FALSE)
  sampleTimes = index(amzn)
  result2012 = sapply(sampleTimes, function(date) {
    year(ymd(date)) == 2012
  })
  result2012Monday = sapply(sampleTimes, function(dateString) {
    date = ymd(dateString)
    year(date) == 2012 && wday(date) == 2 #2==Monday
  })
  
  c(table(result2012)[2],table(result2012Monday)[2])
}