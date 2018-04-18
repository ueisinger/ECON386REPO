Project One: README
Authors: U.Eisinger, , M. Stephens, D. Chang, N. Kingery, and J. Watkins
Date: 4.17.2018

##Getting Started
In order to begin this project, you must first pull a copy of all of the data files from GitHub onto your desktop as well as installing/calling any R libraries that will be used. This can be achieved through entering the code below into your terminal. 

###Prerequisites
The first step is to set the current directory to the desired location. The code below sets the current directory to your local desktop. This command will determine where the GitHub folder will end up. 
`cd desktop`

To Pull the data from GitHub and get it on your local desktop, use the command `git clone` in the terminal. Copy the HTTPS from the GitHub repository that you wish to clone and paste in the terminal. 
`git clone "https://github.com/ueisinger/ECONBD386"`

###Installing 
The only library that is used is `dplyr`. You can call this library up using the following code. 
`library(dplyr)`



##Task One Materials 
The dataset included the following files. 
The files used in the dataframe for task one are listed below. 

Files | Purpose
------------ | -----------------------------
features.txt | A list of all of the features that were recorded for the experiment. This data is used as the columns for the dataframe. 
subject_train.txt | List of the subjects that participated in this experiment.
subject_test.txt | List of the subjects that participated in this experiment.
y_train.txt | List of the activity numeric values. 
y_test.txt | List of the activity numeric values. 
X_train.txt | List of the data obtained in the previous experiment. 
X_test.txt | List of the data obtained in the previous experiment. 

We also need the following files to gather more information about the datasets and the project as a whole.

Files | Purpose
------------ | -----------------------------
activity_labels.txt | Indicate the qualitative measure of the activity data. These correspond to the numeric values in the y_train and y_test dataset. 
features_info.txt | Description of each of the features and how exactly they were obtained. 
README.txt | Overview of the original experiment and how the data was collected. 

##Task One Data Transformations
Below is a general list of each of the data transformations that we made to obtain tidy1.txt.  
1. Importing the data from the txt files from the Econ386REPO, and saving them as objects using `read.table`. 
2. Setting the first column that has numbers assigned to headers to null.
3. Transposing the Header object so that the data frame changes from 1 column, 561 rows to 561 columns, 1 row. This also changes the data type to char.
4. Merging the data into the same columns and rows using `rbind` and `cbind`. 
5. Changing the name of the header row to be Subjects, Activity and the strings of newHeaders.
6. Selecting columns individually with subject, activity, std, mean, and then subsetting into a new table using the `dplyr` library and the function `grep`.
7. Renaming the activity column so that the numbers change to the actual activity.
8. Grouping the subjects and activities into subgroups.
9. Summarizing each subject with the mean and standard deviation of each of the six activities using `summarise_all`. 
10. Used `write.table()` to save results as a file called tidy1.txt. 


##Task Two Materials
The file used for task two is below.

Files | Purpose
------------ | -----------------------------
Panel_8589.txt | Data obtained from the experiment _Decomposing Electric Power Plant Emissions Within a Joint Production Framework_. 

We also need the following file to gather information about the dataset and the project as a whole. 

Files | Purpose
------------ | -----------------------------
Pasurka_2006.pdf | Research paper titled _Decomposing Electric Power Plant Emissions Within a Joint Production Framework_. Includes Abstract, Introduction, Previous Research and References. 

###Task Two Data Transformations
Below is a general list of each of the data transformations that we made to obtain tidy2.txt. 

1. Set the working directory to where the .txt file is on your computer using `setwd()`. 
2. Loading the file into R using `read.table` function
3. Renaming the variables by creating a vector. 
4. Convert all energy measurements (energy produced and heat contents) into daily averages, measured in Mwh.
5. Convert all pollutants quantities, measured in annualized short tons, into daily averages.
6. Convert all dollars (measured in 1973 $???s) into 2017 dollars.
7. Add a factor variable indicating whether or not Phase I of the Clean Air Act had already been announced or not (the CAA Phase I restrictions were announced in 1990) using `ifelse`. 
8. Create tidy2.txt file using `write.table()` function. 

Below is a general list of each of the data transformations that we made to obtain tidy2_a.txt. 

1. Creating separate dataframes that contain the averages of each variable using `aggregate`. 
2. Merging the dataframes together. 
3. Create the tidy2_a.txt file. 

Below is a general list of each of the data transformations that we made to obtain tidy2_b.txt.

1. Creating separate dataframes that contain the sum of each variable using `aggregate`. 
2. Merging the dataframes.
3. Create the tidy2_b.txt file.

