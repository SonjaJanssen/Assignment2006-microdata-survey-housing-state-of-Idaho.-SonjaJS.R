# Data Cleaning Assignment
# 2006 Microdata Survey on Housing in Idaho
# Date: March 22, 2023
# Code by: SonjaJS

# ----------------------------------------------------------------------------------------------------- #

# Download the 2006 microdata survey about housing in Idaho:
# Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# Code Book: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

# Clear the workspace
rm(list=ls())

# ----------------------------------------------------------------------------------------------------- #
# Download file using fread from the data.table package
library(data.table)
housing_data <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

# Question 1: How many properties are worth $1,000,000 or more?
# VAL represents the property value, and 24 indicates properties worth more than $1,000,000.
# Use .N to count the number of properties falling into this category.
high_value_properties <- housing_data[VAL == 24, .N]
# Answer: 53

# Explanation: This code uses the data.table package to efficiently read and manipulate the housing data.
# The question involves selecting rows where the property value is greater than $1,000,000 and counting them.

# ----------------------------------------------------------------------------------------------------- #
# Question 2: Consider the variable FES in the code book. Which "tidy data" principle does this variable violate?
# Answer: Tidy data has one variable per column.

# Explanation: Tidy data principles state that each variable should have its own column.
# If FES violates this, it means it might contain information that could be better organized.

# ----------------------------------------------------------------------------------------------------- #
# Question 3: Download the Excel spreadsheet on Natural Gas Acquisition Program:
# Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx

# Read rows 18-23 and columns 7-15 into R, then calculate the sum of Zip * Ext.
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(file_url, destfile = paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")
ngap_data <- fread(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum_zip_ext <- sum(ngap_data$Zip * ngap_data$Ext, na.rm = TRUE)
# Answer: 36,534,720

# Explanation: This code downloads an Excel file, reads a specific range of rows and columns, 
# and then calculates the sum of Zip * Ext, presumably for the Natural Gas Acquisition Program.

# ----------------------------------------------------------------------------------------------------- #
# Question 4: Read the XML data on Baltimore restaurants:
# Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

# How many restaurants have zipcode 21231?
# Use http instead of https to avoid XML-related errors.
library(XML)
file_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(sub("s", "", file_url), useInternal = TRUE)
root_node <- xmlRoot(doc)
zipcodes <- xpathSApply(root_node, "//zipcode", xmlValue)
restaurants_21231 <- data.table::data.table(zipcode = zipcodes)
num_restaurants_21231 <- restaurants_21231[zipcode == "21231", .N]
# Answer: 127

# Explanation: This code reads XML data on Baltimore restaurants and extracts information about the zipcodes.
# The result is a count of restaurants with the specified zipcode.

# ----------------------------------------------------------------------------------------------------- #
# Question 5: Download the 2006 microdata survey about housing in Idaho:
# Data: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

# Load the data into an R object using fread().
DT <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

# What is the fastest way to calculate the average value of the variable pwgtp15,
# broken down by sex using the data.table package?
# Answer: Use system.time() to measure the time taken for the calculation.
calculation_time <- system.time(DT[, mean(pwgtp15), by = SEX])

# Explanation: This code downloads another dataset, loads it into R, 
# and then calculates the average value of the variable pwgtp15, broken down by sex.
# system.time() is used to measure the time taken for this operation.

# ----------------------------------------------------------------------------------------------------- #

# Explanation: The code is marked as 100% by peer review, indicating successful completion.


