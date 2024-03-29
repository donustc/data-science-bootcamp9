install.packages("tidyverse")
install.packages("caret")

library(tidyverse)
library(caret)

head(mtcars)

## 1. split data

train_test_split <- function(data, size=0.8) {
  n <- nrow(data)
  train_id <- sample(1:n, size*n)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return(list(train_df, test_df))
}

prep_df <- train_test_split(mtcars, size=0.8)

## 2. train model
ctrl <- trainControl(method = "boot",
                     number = 5)

model <- train(mpg ~ hp + wt + am,
               data = prep_df[[1]],
               method = "lm",
               trControl = ctrl)

## 3. score model
pred_mpg <- predict(model, newdata = prep_df[[2]])

## 4. evaluate model
actual_mpg <- prep_df[[2]]$mpg

## error = actual - prediction
test_mae <- mean(abs(pred_mpg - actual_mpg))
test_rmse <- sqrt(mean((pred_mpg  - actual_mpg)**2))

MAE(pred_mpg, actual_mpg)
RMSE(pred_mpg, actual_mpg)

print(test_mae)
print(test_rmse)
