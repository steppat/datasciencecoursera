#Cleaning Data - Week 2
#
#Question 1
#  
#
#install.packages("httpuv")
week2Question1 <- function() {
  library(httr)
  library(jsonlite)
  
  myapp <- oauth_app("github",key="616f044c7884a3b2a7d5",secret = "dee368fb3f595021086d669f94b941f15dbb0e40")
  github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
  gtoken <- config(token = github_token)
  
  req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
  result <- content(req, type = "text; charset=utf-8")
}