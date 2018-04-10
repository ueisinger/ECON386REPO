##returns current working directory...where R is "pointed" toward
getwd()

##to change current directory to the folder where your data is located (Desktop recommended), enter the path to the folder with "quotes" around it
filepath<-"C:/Users/Steve L/Desktop"  ##here is a variable I've created that stores a string for my computer's desktop filepath
setwd(filepath)  ##setwd("C:/Users/Steve L/Documents") will do the same thing
##for PC:  you can find the file path by holding SHIFT and right clicking the file and using the "Copy as path" option
##for Mac: select the file or folder in the OS X Finder, then hit Command+i to summon Get Info. Click and drag alongside "Where" to select the path, then hit Command+C to copy the full path to the clipboard.

##once R is "pointed" in the right direction using the above, we can import the data assuming it is in the correct format (CSV)
##if the data is not in the correct format, I recommend opening it in Excel and saving it as a .CSV file or looking up documentation in R (Stackoverflow) to import other types of file formats

filename<-"NHIS_2007_Cleaned.csv"   #stores the name of the file in a string
Dataset<-read.csv(filename)  #imports the file into a variable called Dataset which will be a data.frame class variable using the read.csv command
##alternatively we could have used Dataset<-read.csv("NHIS_2007_Cleaned")
##you can also enter a web url instead of the file path if you wanted to download a CSV formatted file directly from the internet

##now that the data is stored in R in the variable Dataset, we can begin exploring the data and manipulating/transforming it
View(Dataset)  ##opens a window to look at the data in a spreadsheet type format
head(Dataset)  ##shows the first 6 rows (observations) in the dataset
tail(Dataset)  ##shows the last 6 rows (observations) in the dataset

##some basic plots using R's base plotting system  (we will also discuss the lattie and ggplot systems)
##we can "grab" a particular variable in the data set by calling the data set and using the dollar sign afterwards with the variable name following:  Dataset$variablename
plot(Dataset$height ~ Dataset$weight)  ##general form is plot(y ~ x)
plot(Dataset$height ~ Dataset$weight, col=factor(Dataset$SEX)) ##colors the plot by the variable SEX
hist(Dataset$weight)  ##generates a histogram of the weight variable
