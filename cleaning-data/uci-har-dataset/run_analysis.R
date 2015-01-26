#Course Project
run_analysis = function() {
  
  setwd("/Users/nico/Documents/dev/coursera/data-science/datasciencecoursera/cleaning-data/")
  
  # Step1. 
  #Merges the training and the test sets to create one data set.
  
  trainData = read.table("./uci-har-dataset/train/X_train.txt")
  testData = read.table("./uci-har-dataset/test/X_test.txt")
  joinedData = rbind(trainData, testData)
  
  trainSubject = read.table("./uci-har-dataset/train/subject_train.txt")
  testSubject = read.table("./uci-har-dataset/test/subject_test.txt")
  joinedSubjects = rbind(trainSubject, testSubject)
  
  trainLabel = read.table("./uci-har-dataset/train/y_train.txt")
  testLabel = read.table("./uci-har-dataset/test/y_test.txt") 
  joinedLabel = rbind(trainLabel, testLabel)
  
  features = read.table("./uci-har-dataset/features.txt")
  activity = read.table("./uci-har-dataset/activity_labels.txt")
  
  # Step2
  # Extracts only the measurements on the mean and standard 
  indexMeanStd = grep("mean\\((.*)|std\\((.*)", features[,2])
  joinedData = joinedData[, indexMeanStd]

  #to be continued ...
  
}  
 
