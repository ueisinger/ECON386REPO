rm(list=ls())  ##clears global environemt of all variables / data loaded from a prior session
##pressing Ctr+L will clear the console window below if it is too cluttered

filepath<-"C:/Users/Steve L/Desktop"  #you'll obviously need to change this to yours
setwd(filepath)

filename<-"NHIS_2007_Cleaned.csv"
NHIS<-read.csv(filename)

##look at summary statistics and check for skewness issues
##is the median close to the mean?
summary(NHIS)
dim(NHIS)  ##returns dimension of data frame (observations X variables)

##can plot a historgram of a variable to help identify any outliers
hist(NHIS$SLEEP)
hist(NHIS$weight)
hist(NHIS$height)
hist(NHIS$educ)
hist(NHIS$BMI)

plot(NHIS$height ~ NHIS$weight)
plot(NHIS$height ~ NHIS$weight, col=factor(NHIS$SEX)) ##colors the plot by the variable SEX

##subsetting by variable(s)
NHIS_0_m<-subset(NHIS, SEX==1)  ##grabs the data from only the males
NHIS_0_f<-subset(NHIS, SEX==2)  ##grabs the data from only the females

##creating newly transformed data sets using the subset() function
NHIS_0<-subset(NHIS, SLEEP<=24)  ##eliminates outliers in the SLEEP variable
dim(NHIS_0)  ##check dimensions of data frame to look for loss of observations
NHIS_1<-subset(NHIS_0, BMI<60)  ##eliminates outliers in the BMI variable
dim(NHIS_1)  ##check dimensions of data frame to look for loss of observations
NHIS_2<-subset(NHIS_1, educ<35)  ##eliminates outliers in the educ variable
dim(NHIS_2)  ##check dimensions of data frame to look for loss of observations
##...and so on and so forth

##or we could have done it in one step
NHIS_A<-subset(NHIS, 
               SLEEP<=24 & BMI<60 & educ<35 & 
                 height<90 & weight<450)

dim(NHIS_A)  ##check dimensions for lost observations

pairs(NHIS_A)
pairs(NHIS_A, col=factor(NHIS_A$SEX))


##eliminating/removing a variable by nullifying it
NHIS_A$HHX<-NULL
NHIS_A$FMX<-NULL
NHIS_A$FPX<-NULL
dim(NHIS_A)  ##check dimensions for lost variables


