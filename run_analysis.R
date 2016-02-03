run_analysis <- function() {
#       
#       The raw data should be placed in a directory named "Data" 
#       where the run_analysis file is located.
#       the function uses dplyr library     
#       
#       the function takes the data sets for both test and train and merge them to
#       one dataset, then filter the variables to the mean and standard deviations
#       measurements. an object called mergeddataset is assigned in the Global Env.
#       another object is a mean summary of the measurements grouped by subject number
#       and the activity

library(dplyr)
      
#       Merging the data: [STEP 1]
      features<-read.table("./data/features.txt",header = FALSE,colClasses = "character")
      activity_labels<-read.table("./data/activity_labels.txt",header=FALSE)
      subject_test<-read.table("./data//test/subject_test.txt",header = FALSE)
      x_test<-read.table("./data//test/X_test.txt",header = FALSE)
      y_test<-read.table("./data//test/y_test.txt",header = FALSE)
      dataset_test<-data.frame(subject_test,y_test,x_test)
      subject_train<-read.table("./data//train/subject_train.txt",header = FALSE)
      x_train<-read.table("./data//train/X_train.txt",header = FALSE)
      y_train<-read.table("./data//train/y_train.txt",header = FALSE)
      dataset_train<-data.frame(subject_train,y_train,x_train)
      dataset<-bind_rows(dataset_test,dataset_train)
            
#       Appropriately labels the data set with descriptive variable names: [STEP 4]
      names(dataset)<-c("subject_num","activity",features[,2])

#       Extracting only mean / standard deviation measurements: [STEP 2]
      dataset<-dataset[,c(1,2,grep("mean\\(|std",names(dataset)))]

#       Descriptive activity names to name the activities in the data set: [STEP 3]
      dataset$activity=factor(dataset$activity,activity_labels[,1],activity_labels[,2])

#       independent tidy data set with the average of each variable for each activity and each subject: [STEP 5]
      meandataset<-summarise_each(group_by(dataset,subject_num,activity),funs(mean))

#       Assigning the objects to the global environment:
      assign("mergeddataset",dataset,envir = .GlobalEnv)
      assign("meansummary",meandataset,envir = .GlobalEnv)

}
