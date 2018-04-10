rm(list=ls())  ##clears global environemt of all variables / data loaded from a prior session
##pressing Ctr+L will clear the console window below if it is too cluttered

filepath<-"C:/Users/Steve L/Desktop"  #you'll obviously need to change this to yours
setwd(filepath)

filename<-"NHIS_2007_Cleaned.csv"
NHIS<-read.csv(filename)



##MobLab 7 solutions
NHIS_ML71<-subset(NHIS, SLEEP<=24)
dim(NHIS)[1]-dim(NHIS_ML71)[1]
NHIS_ML72<-subset(NHIS, weight<450)
sd(NHIS_ML72$height)

##changing coded variable to NA (deletion when necessary!!!)
NHIS_B<-NHIS
NHIS_B$weight[NHIS_B$weight>450]<-NA
mean(NHIS_B$weight)
mean(NHIS_B$weight, na.rm=TRUE)  ##evaluates and ignores NA values
sd(NHIS_B$weight)
sd(NHIS_B$weight, na.rm=TRUE)  ##evaluates and ignores NA values
NHIS_B$SLEEP[NHIS_B$SLEEP>24]<-NA
NHIS_B$BMI[NHIS_B$BMI>60]<-NA
NHIS_B$educ[NHIS_B$educ>35]<-NA
NHIS_B$height[NHIS_B$height>90]<-NA
dim(NHIS_B)  ##check for lost observations
dim(NHIS)   ##check to compare to original data
