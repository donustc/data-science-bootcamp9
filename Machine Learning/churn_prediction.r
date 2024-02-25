library(tidyverse)
library(caret)

churn <- read_csv("churn.csv")

head(churn)

## split data
n <- nrow(churn)
train_id <- sample(1:n, size = 0.8*n)
train_df <- churn[train_id, ]
test_df <- churn[-train_id, ]

## train model
model <- train(churn ~ totaldayminutes + totaldaycharge + totalnightminutes,
               data = train_df,
               method = "glm")

# score model 
p <- predict(model, newdata = test_df)

acc <- mean(p == test_df$churn)
