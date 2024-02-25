# Correlation
cor(mtcars$mpg, mtcars$hp)

plot(mtcars$mpg, mtcars$hp)

cor(mtcars[ , c("mpg","wt","hp")])

# dplyr
install.packages("tidyverse")
library(dplyr)
corMat <- mtcars %>% 
  select(mpg, wt, hp, am) %>% 
  cor()

# compute correlation (r) and sig test
cor(mtcars$mpg, mtcars$hp)
cor.test(mtcars$mpg, mtcars$hp)

# Linear regression
lmFit <- lm(mpg ~ hp, data = mtcars)
summary(lmFit)
lmFit

# predictiion
lmFit$coefficients[[1]] + lmFit$coefficients[[2]]*200

new_cars <- data.frame(
  hp = c(250, 320, 400, 410, 450)
)
  
# predict()
new_cars$mpg_pred <- predict(lmFit, newdata = new_cars)
new_cars

summary(mtcars$hp)  
  
# RMSE
lmFit_V2 <- lm(mpg ~ hp + wt + am, data = mtcars)
lmFit_V2
coefs <- coef(lmFit_V2)
coefs
coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1  
  
# Build Full Model
lmFit_Full <- lm(mpg ~ ., data = mtcars)
mtcars$predicted <- predict(lmFit_Full)

head(mtcars)

# Train RMSE
squared_error <- (mtcars$mpg - mtcars$predicted) ** 2
rmse <- sqrt(mean(squared_error))
rmse

# Split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size=n*0.7)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

# Train Model
model1 <- lm(mpg ~ hp+ wt+ am+ disp, data = train_data)
p_train <- predict(model1)
rmse_train <- sqrt(mean((train_data$mpg - p_train)**2))

# Test Model
p_test <- predict(model1, newdata = test_data)
rmse_test <- sqrt(mean((test_data$mpg - p_test)**2))

# Print Result
cat("RMSE Train:", rmse_train,
    "\nRMSE Test:", rmse_test)
