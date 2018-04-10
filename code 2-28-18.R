rm(list=ls())  ##clears global environemt of all variables / data loaded from a prior session
##pressing Ctr+L will clear the console window below if it is too cluttered

filepath<-"C:/Users/Steve L/Desktop"  #you'll obviously need to change this to yours
setwd(filepath)

filename<-"NHIS_2007_Cleaned.csv"
Dataset<-read.csv(filename)

###new today:  how to pull the data directly from an internet source
trainingURL<-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
download.file(trainingURL, "training.csv")  ##will download to your current working directory (where R is "pointed")


##scraping a webpage for html
scrapestring<-readLines("http://www.sandiego.edu/campus-life/campus-dining.php")
View(scrapestring)