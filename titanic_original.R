setwd("C:/Users/NP/Desktop/SPRINGBOARD/Titanic cleaning the data")
install.packages("readr")
install.packages("dplyr")
library("readr")
library("dplyr")
titanic <- read_csv("titanic_original.csv")
View(titanic)

# shows us how many NA are in each column 
colSums(is.na(titanic))

#1 replaces all NA in embarked to S
titanic$embarked[is.na(titanic$embarked)]<-"S"
colSums(is.na(titanic)) 

#2 Missing age value to mean age, I picked mean age to replace the na values because it will maintain the mean of Age 
titanic$age[is.na(titanic$age)]<-mean(na.omit(titanic$age))
colSums(is.na(titanic)) 

#3 Lifeboat missing values to None
titanic$boat[is.na(titanic$boat)]<-"None"
colSums(is.na(titanic)) 
summary(titanic)
titanic_new
#4
print("Does it make sense to fill missing cabin numbers with a value?")
print("Out of 1310 values 1015 do not have a cabin number so it does not make sense to add a value, it may lead to bias in data.")
print("What does a missing value here mean?")
print("The values would indicate which cabinet number the person is located in, and na would indicate the person was not able to have a cabin")

#Create a column has_cabin_number which has a cabin number or 0 otherwise
titanic$cabin<-lapply(titanic$cabin, as.character)
titanic$has_cabin_number<- if_else(titanic$cabin== "NA", 0, 1)
titanic$has_cabin_number[which(is.na(titanic$has_cabin_number))]<-0
titanic$has_cabin_number<-as.integer(titanic$has_cabin_number)
titanic$cabin<-as.character(titanic$cabin)
titanic_new<-titanic
titanic_new<-data.frame(titanic_new)
titanic_new

#saves as a csv file
write.csv(titanic,"titanic_clean.csv")

