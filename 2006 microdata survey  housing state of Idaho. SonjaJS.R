
# Week 1: assignment get data cleaned
# 2006 microdata survey housing state of Idaho
# Date: 22 March 2023
# Codes by: SonjaJS
# Graded Assignment: 100% review

###-----------------------------------------------------------------------------------------------------##

# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
  
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

# Question 1: - Load the data into R. The code book, describing the variable names is in the pdf file
#               - How many properties are worth $1,000,000 or more?
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 


rm(list=ls())

###-----------------------------------------------------------------------------------------------------##
# Download file with fread in combination with data.table:

library(data.table)
housing <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")


# 1. How many properties are worth $1,000,000 or more?
# VAL is the property value, so how much it's worth and in row number 24 is >$1000000+ 
# vAL == 24 means the property value in row number 24 is worth more than $1000.0000+
# N means te number of  row

housing[VAL == 24, .N]
# Answer is 53
# [1] 53

###-----------------------------------------------------------------------------------------------------##
# Question 2.
# Use the data you loaded from Question 1. Consider the variable FES in the code book. 
# Which of the "tidy data" principles does this variable violate? 
  
# Answer: # Tidy data has one variable per column. 

###-----------------------------------------------------------------------------------------------------##
# Question 3  Code nog nakijken deels werkt het! dus assignment not OK for this part!

# Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
  
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 

fileURL <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx")
download.file(fileURL, destfile=paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
dat <- data.table::fread(file="getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex=1, rowIndex=18:23, colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T)
  
###--------------------------------------------------------------------------------------###  

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")

dat <- xlsx::read.xlsx(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T) # whats the value of
# (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)
# Answer:
# 36534720
 
##------------------------------------------------------------------------------------------------------##
### Codes tested: ok assignment completed

# Question 4
# Read the XML data on Baltimore restaurants from here:
  
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

# How many restaurants have zipcode 21231?
  
#  Use http instead of https, which caused the message Error: XML content does not seem to be XML: 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'.

# install.packages("XML")
library("XML")
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- XML::xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)
rootNode <- XML::xmlRoot(doc)

zipcodes <- XML::xpathSApply(rootNode, "//zipcode", XML::xmlValue)
xmlZipcodeDT <- data.table::data.table(zipcode = zipcodes)
xmlZipcodeDT[zipcode == "21231", .N]

# Answer: 
# 127

##------------------------------------------------------------------------------------------------------##

# Question 5
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

# using the fread() command load the data into an R object

# DT

# Which of the following is the fastest way to calculate the average value of the variable

pwgtp15

#broken down by sex using the data.table package?
  
  DT <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
DT
# Answer (fastest):
# system.time(DT[,mean(pwgtp15),by=SEX])

##------------------------------------------------------------------------------------------------------##
# Graded assignment: 100% by review by peers
