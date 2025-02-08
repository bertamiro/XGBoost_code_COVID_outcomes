# Load required packages
library(caret)

# Load trained model and test data
load("xgboost_model.RData")
load("processed_data.RData")

# Make predictions
testPred <- predict(xgboost_train, newdata = testData)

# Save predictions
write.csv(testPred, "predictions.csv", row.names = FALSE)
