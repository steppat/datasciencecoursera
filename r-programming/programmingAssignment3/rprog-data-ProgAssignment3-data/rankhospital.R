rankhospital <- function(state, outcome, num = "best") {
  
  measures <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #verificando input
  states <- measures$State[measures$State == state]
  if(length(states) == 0) {
    stop('invalid state')
  }
  
  outcomeNames <- c('heart attack', 'heart failure', 'pneumonia')  
  if(!is.element(outcome,outcomeNames)) {
    stop('invalid outcome')
  }
  
  
  #criando um dictionary  
  #heart attack : 11   
  #heart failure : 17
  #pneumonia : 13
  outcomeColumns <- c(11, 17, 23)
  names(outcomeColumns) <- outcomeNames 
  column <- outcomeColumns[outcome]
  
  measureOfState = subset(measures,State==state)
  measureOfState[,column] <- as.numeric(measureOfState[,column])
  
  #Order by outcome (measureOfState[column]) e name (measureOfState[2]) 
  orderedMeasureOfState<-measureOfState[order(measureOfState[column],measureOfState[2]),]
  
  orderedMeasureOfState <- orderedMeasureOfState[complete.cases(orderedMeasureOfState[,column]),]
  
  if(num == 'best') {
    num <- 1
  }
  
  if(num == 'worst') {
    num <- nrow(orderedMeasureOfState)
  }
  
  orderedMeasureOfState[num,2] 
  
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
}
