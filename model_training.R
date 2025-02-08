# Loading required libraries
library(caret)     # For model training and evaluation
library(xgboost)   # For XGBoost model
library(dplyr)     # For data manipulation

# Load preprocessed training data
load("processed_data.RData")

# Set the seed for reproducibility
set.seed(1234)

# Define hyperparameter tuning grid for XGBoost model
xgb_grid <- expand.grid(
  nrounds = 1000,             # Number of boosting rounds
  eta = c(0.001, 0.01, 0.1), # Learning rate
  gamma = c(0, 0.5, 1),      # Regularization term
  max_depth = c(2, 4, 6, 8, 10) # Maximum tree depth
)

# Set up cross-validation settings
cv_control <- trainControl(
  method = "cv",              # Cross-validation method
  number = 10,                # Number of folds for cross-validation
  search = "grid",            # Grid search for hyperparameter tuning
  verboseIter = TRUE,         # Display training process information
  returnResamp = "all",       # Return resampling results for each iteration
  classProbs = TRUE,          # Enable calculation of class probabilities
  summaryFunction = twoClassSummary # Use two-class summary metrics for classification problems
)

# Prepare training data by excluding the target variable ('outcome')
train_matrix <- data.matrix(select(trainData, -outcome))

# Train the XGBoost model using the specified parameters
xgb_model <- train(
  y = as.factor(trainData$outcome),  # Response variable (outcome)
  x = train_matrix,                  # Predictor matrix
  method = "xgbTree",                # Model type (XGBoost)
  trControl = cv_control,            # Cross-validation settings
  tuneGrid = xgb_grid                # Hyperparameter tuning grid
)

# Save the trained model for future use
save(xgb_model, file = "xgboost_model.RData")

# Optionally, display the best tuning parameters and performance
print(xgb_model$bestTune)

