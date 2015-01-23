===========================================
## Getting and Cleaning Data Course Project
#### Version 1.0 
---------------
**_Objective_**
  * Collect data and work with it to get tidy dataset that can be used for later analysis.  
  
**_Raw Data Description_**  
  * The dataset is obtained from experiment carried out with 30 volunteers, who perfomed six activities wearing smartphone.  
  * There are two sets of data, training and testing which consist of following 6 files.  
    - 'X_train.txt': Training set.  
	- 'y_train.txt': Training labels.    
	- 'subject_train.txt': Each row identifies the subject who performed the activity.  
	- 'X_test.txt': Test set.  
	- 'y_test.txt': Test labels.  
	- 'subject_test.txt': Each row identifies the subject who performed the activity.  
	
**_Setup_**  
  * Working directory of project is, 'E:/Nilam/Coursera/CleaningData/Course_Project/UCI HAR Dataset/'.   
  * Working directory consist of 'run_analysis.R' script, 'train' and 'test' folders.  

**_Process to get tidy dataset_**  
  * Downloaded the data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip].    
  * Extracted data in 'E:/Nilam/Coursera/CleaningData/Course_Project/' folder.  
  * Set working directory to 'E:/Nilam/Coursera/CleaningData/Course_Project/UCI HAR Dataset/'.  
  * Read data from 'train' folder: X_train.txt, y_train.txt, subject_train.txt.  
  * Read data from 'test' folder: X_test.txt, y_test.txt, subject_test.txt.  
  * Imported colnames by reading 'features.text' file from working directory.  
  * Merged datasets, got created by reading X_train.txt, y_train.txt and subject_train.txt files to 'finalTrainData' (Dimesions:7352 rows and 563 columns).  
  * Merged datasets, got created by reading X_test.txt, y_test.txt and subject_test.txt files to 'finalTestData' (Dimesions: 2947 rows and 563 columns).  
  * Then merged 'finalTrainData' and 'finalTestData' to get final data that we want to clean up(Named as 'mergedData', Dimesions: 10299 rows and 563 columns).  
  * Changed column names of 'mergedData' using data from 'features.text' file.  
  * Selected only variables with  measurements on mean and standard deviation, which leaves data with only 68 variables out 563.  
  * Changed activity numbers to descriptive labels in 'mergedData' by referring to activity_labels file in working directory.  
  * Renamed all 68 variables by assigning them decriptive names according to naming standards.  
  * Finally calculated average of all variables(except subject, Activity) by each subject and their activity which gave me final tidy data.
  * Exported final tidy data in a text file.  
  
**_Final Result_**  
  * Tidy dataset with 180 observations(30 subject X 6 Activities) and 68 variables.  
  