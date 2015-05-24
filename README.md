#Course Project

##Introduction:
This README provides details of my implementation of the course project for “Getting Cleaning Data” offered by Johns Hopkins University through Coursera.com.

##Objective:
The purpose of this project is to demonstrate the ability to download, merge, and clean a data set. The goal is to prepare a result tidy dataset that could support subsequent analysis.

##Activities to be done:
The project activities are provided in the “Getting and Cleaning Data” Course Project description at  
https://class.coursera.org/getdata-014/human_grading/view/courses/973501/assessments/3/submissions

Create a R script called run_analysis() that does the following

1. Merges the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


##Hardware: 
* Macbook Pro (Retina 2012) running OSX Yosimite Version 10.10.2
* Processor: 2.3 GHz Intel Core i7
* Memory: 8 GB 1600 MHz DDR3

##Tools:
* RStudio version 0.98.1102
* R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
* plyr     "Tools for for splitting, applying, and combining data”     v1.8.1
* dplyr   “A Grammar of Data Manipulation”     v0.4.1


##Data Source:
[Data Description and Background](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
[Project Data Download Site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Processing:

Please see the `run_analysis.R` script for the R code to implement each of the project steps, defined above. The function is availble [here](https://github.com/seancaron/GettingAndCleaningData/blob/master/run_analysis.R).  

A “pseudo code” description of the activities performed follows.

Set-up functions  

1. Load the `plyr` and `dplyr` R libraries - in that order  
2. Check the working directory to see if the zipped datafile has been previously downloaded. The function expects the downloaded file to be in the working directory and named `Dataset.zip`. If the file is not present, download it from the Project Data Download Site source referenced above.  
3. The function will then read all necessary data from the ZIP file without requiring it to be unzipped into the working directory.  

Merge Training and Test datasets   

1. The R `rbind()` function is used to merge the complete `x_test` and `x_train` datasets into an x dataframe. All columns are included at this point
2. `rbind()` is also used to merge the `y_test` and `y_train` data into a y dataframe - each y datarow specifies the activity number for all measurments in the corresponding x datarow.

Extract only the measurements on the mean and standard deviation for each measurement   

1. The `feature` names are added to the x dataframe
2. The `dplyr` `select( contains())` function is used to select only the mean() and std() columns from the x dataframe into a new raw dataframe

Use descriptive activity names to name the activities in the data set   

1. The `plyr` `mapvalues` function is used to replace the activty number with a descriptive name from the `activity_labels.txt` file  
2. The y dataframe is also then merged into the raw dataframe using `cbind` and given the descriptive column name `activity`  
3. Finally, the merged `Subject_test` and `Subject_train` dataframe is merged into the raw dataframe via `cbind` and given the descriptive column name `subject`  

Appropriately label the data set with descriptive variable names.   

1. This step is actually performed earlier, before the mean and std columns are selected - the descriptive names make it easy to select the reqired variables  
2. This step is accomplished with the R function `colnames() <- <new name vector>`  

Create a second, independent tidy data set with the average of each variable for each activity and each subject.   

1. The `dplyr` `group_by` function is used to group the working raw dataframe by activty, then subject  
2. The `dplyr` `summarise_each(... funs(mean))` function is used to create the final dataframe
3. The final dataframe is written to the file `tidy_data.txt` with the `write.table(... row.name=FALSE)` function  


##Running the function

To run the script, source `run_analysis.R`. Run the function with the command `run_analysis()`, you will see the following output as the function executes  

``` {r}
[1] "run_analysis: fetching the dataset from cloudfront.net"  
[1] "run_analysis: loading Features and Activty Labels"  
[1] "run_analysis: loading Subjects"  
[1] "run_analysis: loading Test data"  
[1] "run_analysis: loading Train data"  
[1] "run_analysis: Merging data"  
[1] "run_analysis: Producing final dataset"  
[1] "run_analysis: Writing final dataset"  
```

##Final Tidy Data Set
The resulting tidy dataset is in the working directory and called `tidy_data.txt`. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.  

It can be read using the command  

``` {r}
read.table("tidy_data.txt", header=TRUE)
```

This tidy dataset contains rows of each of 6 activities for each of 30 subjects, a total of **180 observations of 68 variables** with - 1 column each for activity and subject and 66 columns for measurement variables.  

Please see the accompanying `codebook.md` for details of the composition and nature of the measurment variables  

##Acknowledgements  
Detailed content suggestions for this README were obtained through the "Getting and Cleaning Data" course project discussion forums on Coursera, particularly  
  
[David's personal course project FAQ, Started by David Hood](https://class.coursera.org/getdata-014/forum/thread?thread_id=30)  
[Tidy data and the Assignment, Started by David Hood](https://class.coursera.org/getdata-014/forum/thread?thread_id=31)  





