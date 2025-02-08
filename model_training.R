# Load required packages
library(caret)
library(xgboost)
library(dplyr)

# Load preprocessed data
load("processed_data.RData")

# Define tuning grid
xgb_grid <- expand.grid(nrounds = 1000,
                        eta = c(0.001, 0.01, 0.1),
                        gamma = c(0, 0.5, 1),
                        max_depth = c(2, 4, 6, 8, 10))

# Set up cross-validation
trControl <- trainControl(method = "cv",
                          number = 10,
                          search = "grid",
                          verboseIter = TRUE,
                          returnResamp = "all",
                          classProbs = TRUE,
                          summaryFunction = twoClassSummary)

# Prepare training data
matTrain <- data.matrix(select(trainData, -outcome))
set.seed(1234)

# Train XGBoost model
xgboost_train <- train(y = as.factor(trainData$outcome),
                       x = matTrain,
                       method = "xgbTree",
                       trControl = trControl,
                       tuneGrid = xgb_grid)

# Save trained model
save(xgboost_train, file = "xgboost_model.RData")
