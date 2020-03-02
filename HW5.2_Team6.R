# Lab 5 Part 2
# Team: 6
# Team Members:
#   Melvin Zaldivar - Members contribution: 33.33%
#   Rahim Abdulmalik - Members contribution: 33.33%
#   Raul Beiza - Members contribution: 33.33%

# Due Date: March 1, 2020

#--------------------------------------------
# Step 1 Construct the table
#--------------------------------------------

# Installing the C5.0 algorithm
install.packages("C50")

# Reading the C.50 package
library(C50)

# Construct Features
home_owner <- c("Yes","No","No","Yes","No",
                 "No","Yes","No","No","No")
maritual_status <- c("Single","Married","Single","Married",
                   "Divorced","Married","Divorced","Single",
                   "Married","Single")
annual_income <- c(125000,100000,70000,120000,95000,60000,
                   220000,85000,75000,90000)
default_borrow <- c("No","No","No","No","Yes",
                    "No","No", "Yes", "No","Yes")
loan_table <- data.frame(home_owner,maritual_status,annual_income,default_borrow)
loan_table

test_home_owner <- c("No")
test_maritual_status <- c("Married")
test_annual_income <- c(120000)

test_loan_table <- data.frame(test_home_owner, test_maritual_status,
                              test_annual_income)

#--------------------------------------------
# Step 2 Training a model on the data
#--------------------------------------------

# create model using the C5.0 decision tree
loan_model <- C5.0(loan_table[-4], loan_table$default_borrow)
loan_model

# See the tree's decision summary
summary(loan_model)

#-------------------------------------------
# Step 3 Predict for test sample
#-------------------------------------------
predict_test <- predict(loan_model, test_loan_table)
predict_test