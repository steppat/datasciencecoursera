best <- function(state, outcome) {
  
  measures <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  states <- measures$State[measures$State == state]
  if(length(states) == 0) {
    stop('invalid state')
  }
  
  outcomeNames <- c('heart attack', 'heart failure', 'pneumonia')  
  if(!is.element(outcome,outcomeNames)) {
    stop('invalid outcome')
  }
  
  outcomeColumns <- c(11, 17, 23)
  names(outcomeColumns) <- outcomeNames #criando um dictionary
  
  column <- outcomeColumns[outcome]
  
  measureOfState = subset(measures,State==state)
  measureOfState[,column] <- as.numeric(measureOfState[,column])
  orderedMeasureOfState<-measureOfState[order(measureOfState[column]),]
  
  orderedMeasureOfState[1,2] 
}
# > source("best.R")
# > best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# > best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# > best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# > best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# 
# Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
# outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
# with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
# in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
# be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular
# outcome should be excluded from the set of hospitals when deciding the rankings.
# Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
# be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals “b”, “c”,
#                                                                                      and “f” are tied for best, then hospital “b” should be returned).
# The function should use the following template.
# best <- function(state, outcome) {
#   ## Read outcome data
#   ## Check that state and outcome are valid
#   ## Return hospital name in that state with lowest 30-day death
#   ## rate
# }
# The function should check the validity of its arguments. If an invalid state value is passed to best, the
# function should throw an error via the stop function with the exact message “invalid state”. If an invalid
# outcome value is passed to best, the function should throw an error via the stop function with the exact
# message “invalid outcome”.