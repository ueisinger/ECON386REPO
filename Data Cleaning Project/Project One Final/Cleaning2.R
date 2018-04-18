##Task 2

##--D.Chang and J.Watkins--
##Setting the current working directory to where the .txt file is on your computer.
getwd()
setwd("/Users/andreabohneisinger/Desktop/ECONBD386/Data Cleaning Project/Task 2") 
rm(list=ls())

##Loading the file into R.
Dataset <- read.table("~/Desktop/ECONBD386/Data Cleaning Project/Task 2/Panel_8595.Txt", skip = 2)

##Renaming the variables.
Dataset[2] <- NULL
names(Dataset) <- c("Plant_I.D.", "Year", "ElectricityKWH", "Sulfur_Dioxide_Daily", "Nitrous_Oxide_Daily", "Dollars_Millions", 
                  "Employees", "Heat_Content_of_Coal_Daily","Heat_Content_of_Oil_Daily", "Heat_Content_of_Gas_Daily")

##Convert all energy measurements (energy produced and heat contents) into daily averages, measured in Mwh.
Dataset <- transform(Dataset, ElectricityKWH = Dataset$ElectricityKWH/1000000)
Dataset <- transform(Dataset, Heat_Content_of_Gas_Daily = Dataset$Heat_Content_of_Gas_Daily*0.29307/365000000000)
Dataset <- transform(Dataset, Heat_Content_of_Oil_Daily = Dataset$Heat_Content_of_Oil_Daily*0.29307/365000000000)
Dataset <- transform(Dataset, Heat_Content_of_Coal_Daily = Dataset$Heat_Content_of_Coal_Daily*0.29307/365000000000)
View(Dataset)

##Convert all pollutants quantities, measured in annualized short tons, into daily averages.
Dataset <- transform(Dataset, Sulfur_Dioxide_Daily = Dataset$Sulfur_Dioxide_Daily/365)
Dataset <- transform(Dataset, Nitrous_Oxide_Daily = Dataset$Nitrous_Oxide_Daily/365)
View(Dataset)

##Convert all dollars (measured in 1973 $’s) into 2017 dollars.
Dataset <- transform(Dataset, Dollars_Millions = Dataset$Dollars_Millions*5.5132/1000000)
View(Dataset)

##Add a factor variable indicating whether or not Phase I of the Clean Air Act had already been announced or not (the CAA Phase I restrictions were announced in 1990).
Dataset$CAA <- ifelse(Dataset$Year>=90, 1, 0)
View(Dataset)
Dataset[11:12] <- NULL

##Create tidy2.txt file.
write.table(Dataset, file = "tidy2.txt")
View(Dataset)




##Task2_a

##Creating separate dataframes that contain the averages of each variable.
tidy2a_1 <- aggregate(ElectricityKWH ~ Plant_I.D. , data=Dataset, mean)
tidy2a_2 <- aggregate(Sulfur_Dioxide_Daily ~ Plant_I.D. , data=Dataset, mean)
tidy2a_3 <- aggregate(Nitrous_Oxide_Daily ~ Plant_I.D. , data=Dataset, mean)
tidy2a_4 <- aggregate(Dollars_Millions ~ Plant_I.D. , data=Dataset, mean)
tidy2a_5 <- aggregate(Employees ~ Plant_I.D. , data=Dataset, mean)
tidy2a_6 <- aggregate(Heat_Content_of_Coal_Daily ~ Plant_I.D. , data=Dataset, mean)
tidy2a_7 <- aggregate(Heat_Content_of_Oil_Daily ~ Plant_I.D. , data=Dataset, mean)
tidy2a_8 <- aggregate(Heat_Content_of_Gas_Daily ~ Plant_I.D. , data=Dataset, mean)
tidy2a_9 <- aggregate(CAA ~ Plant_I.D. , data=Dataset, mean)

##Merging the dataframes together. 
tidy2a_0<-(Reduce(function(x, y) merge(x, y, all=TRUE), list(tidy2a_1, tidy2a_2, tidy2a_3,tidy2a_4,tidy2a_5,tidy2a_6,tidy2a_7,tidy2a_8,tidy2a_9)))
View(tidy2a_0)

##Create the tidy2_a.txt file. 
write.table(tidy2a_0,"tidy_2a.txt")




##Task2_b

##Creating separate dataframes that contain the sum of each variable.
tidy2b_1 <- aggregate(ElectricityKWH ~ Year , data=Dataset, sum)
tidy2b_2 <- aggregate(Sulfur_Dioxide_Daily ~ Year , data=Dataset, sum)
tidy2b_3 <- aggregate(Nitrous_Oxide_Daily ~ Year , data=Dataset, sum)
tidy2b_4 <- aggregate(Dollars_Millions ~ Year , data=Dataset, sum)
tidy2b_5 <- aggregate(Employees ~ Year , data=Dataset, sum)
tidy2b_6 <- aggregate(Heat_Content_of_Coal_Daily ~ Year , data=Dataset, sum)
tidy2b_7 <- aggregate(Heat_Content_of_Oil_Daily ~ Year , data=Dataset, sum)
tidy2b_8 <- aggregate(Heat_Content_of_Gas_Daily ~ Year , data=Dataset, sum)
tidy2b_9 <- aggregate(CAA ~ Year , data=Dataset, sum)

##Merging the dataframes.
tidy2b_0<-(Reduce(function(x, y) merge(x, y, all=TRUE), list(tidy2b_1, tidy2b_2, tidy2b_3,tidy2b_4,tidy2b_5,tidy2b_6,tidy2b_7,tidy2b_8,tidy2b_9)))
View(tidy2b_0)

##Create the tidy2_b.txt file.
write.table(tidy2b_0,"tidy_2b.txt")
