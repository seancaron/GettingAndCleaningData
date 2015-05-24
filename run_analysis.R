##########################################################################################
##
##    Getting and Cleaning Data Sets
##    Course Project
##
##    run_analysis()    a function with no parameters that obtains, cleans, and produces
##                      a deriviative tidy data set
##


run_analysis <- function()
{
      library(plyr)           ## load plyr
      library(dplyr)          ## load the dplyr library for access to multiple functions used throughout the function
      
      if (!file.exists("Dataset.zip")) {        ## check for the dataset in the working directory - if not present, download
                                                ## note the this download uses "method="curl" for Mac OSX - this may need to 
                                                ## be modified for use on Windows or *nix operating systems
            print("run_analysis: fetching the dataset from cloudfront.net")
            download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip", method="curl")
      }

      ## obtain file connection handles to the components of the ZIP file we need to build the merged dataset
      zipfile <- c("Dataset.zip")
      zip.Features.handle <- unz(zipfile, "UCI HAR Dataset/features.txt")
      zip.Activities.handle <- unz(zipfile, "UCI HAR Dataset/activity_labels.txt")
      zip.Subject_test.handle <- unz(zipfile, "UCI HAR Dataset/test/subject_test.txt")
      zip.Subject_train.handle <- unz(zipfile, "UCI HAR Dataset/train/subject_train.txt")
      zip.X_test.handle <- unz(zipfile, "UCI HAR Dataset/test/X_test.txt")
      zip.y_test.handle <- unz(zipfile, "UCI HAR Dataset/test/y_test.txt")
      zip.X_train.handle <- unz(zipfile, "UCI HAR Dataset/train/X_train.txt")
      zip.y_train.handle <- unz(zipfile, "UCI HAR Dataset/train/y_train.txt")

      ## using the handles obtained above, read in from the ZIP file the data components for the merged dataset
      print("run_analysis: loading Features and Activty Labels")
      zip.Features <- read.table(zip.Features.handle, stringsAsFactors=FALSE)       ## Features are the main dataset column identifiers
      activity.labels <- read.table(zip.Activities.handle, stringsAsFactors=FALSE)  ## Activiy labels define the y test and train data
      print("run_analysis: loading Subjects")
      zip.Subject_test <- read.table(zip.Subject_test.handle)                       ## Subject identifies the test subject for the data
      zip.Subject_train <- read.table(zip.Subject_train.handle)
      print("run_analysis: loading Test data")
      zip.X_test <- read.table(zip.X_test.handle)                                   ## the X dataset contains the raw observations
      zip.y_test <- read.table(zip.y_test.handle)                                   ## the y dataset containd the activity that produced
                                                                                    ## the X observation data
      print("run_analysis: loading Train data")
      zip.X_train <- read.table(zip.X_train.handle)
      zip.y_train <- read.table(zip.y_train.handle)
      
      print("run_analysis: Merging data")
      x_df <- rbind(zip.X_test,zip.X_train)                                         ## merge the test and train X observations
      y_df <- rbind(zip.y_test,zip.y_train)                                         ## merge the test and train Y observations (activities)

      colnames(x_df) <- unlist(zip.Features$V2)                                     ## give the X dataframe meainingful column names
                                                                                    ## as defined by the Features list
      
      y_df <- rbind(zip.y_test,zip.y_train)                                         ## merge the test and train Y observations (activities)
      
      Subject_df <- rbind(zip.Subject_test,zip.Subject_train)                       ## merge subject information for test and train observations
      
      ## construct the final raw dataset from which we will build the result tidy dataset
      
      x_df <- x_df[!duplicated(names(x_df))]                                        ## clean up the data by removing any duplicate columns
      raw_df <- cbind(select(x_df,contains("mean()")),select(x_df,contains("std()")))   ## select columns containing mean and std. dev. data
      
      y_df <- data.frame(mapvalues(unlist(y_df),1:6,activity.labels$V2))            ## replace y integers with descriptive activity values
      raw_df <- cbind(y_df, raw_df)                                                 ## add activity to the raw_df
      names(raw_df)[1] = "activity"                                                 ## And give it a readable column name
      
      raw_df <- cbind(Subject_df, raw_df)                                           ## lastly, add in the Subject id
      names(raw_df)[1] = "subject"                                                  ## And give it a readable column name
      
      print("run_analysis: Producing final dataset")
      raw_df <- group_by(raw_df, activity, subject)                                 ## group the df by activity, then subject
      final_df <- summarise_each(raw_df, funs(mean))                                ## and finally, produce the final dataset
      
      print("run_analysis: Writing final dataset")                                  ## write the tidy dataset back to the working dir
      write.table(final_df, "tidy_data.txt", row.name=FALSE)

}

