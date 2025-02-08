# Loading required libraries
library(caret)  # For model prediction

# Load the trained XGBoost model and test data
load("xgboost_model.RData")  # Load the trained XGBoost model
load("processed_data.RData")  # Load the preprocessed data (ensure it contains testData)

# Make predictions on the test dataset
xgb_pred <- predict(xgb_model, newdata = testData)

# Save predictions to a CSV file
write.csv(xgb_pred, "predictions.csv", row.names = FALSE)


# Load necessary libraries
library(caret)
library(pROC)

# Make binary predictions on test data
xgb_pred_binary <- ifelse(xgb_pred > 0.5, 1, 0)  # Convert probabilities to binary classes

# Prepare true labels from the validation set
test_labels <- trainData$outcome[-index_train]
test_labels_numeric <- as.numeric(test_labels == "Yes")  # Convert to numeric (1 = "Yes", 0 = "No")

# Confusion Matrix to evaluate model performance
cm <- confusionMatrix(factor(xgb_pred_binary), factor(test_labels_numeric))
print(cm)

# AUC Calculation using pROC
test_probabilities <- predict(xgb_model, testData, type = "prob")
auc_ci <- ci.auc(test_labels_numeric, test_probabilities)
print(paste("95% CI for AUC:", auc_ci))  # Confidence interval for AUC

# AUC Score
auc_score <- auc(test_labels_numeric, test_probabilities)
print(paste("AUC Score:", auc_score))

# ROC Curve with Confidence Intervals
roc_curve <- roc(test_labels_numeric, test_probabilities)
plot_roc_with_ci <- function(roc_obj) {
  ci_roc <- ci.se(roc_obj, specificities = seq(0, 1, length = 25))
  ci_data <- data.frame(x = as.numeric(rownames(ci_roc)),
                        lower = ci_roc[, 1],
                        upper = ci_roc[, 3])
  
  ggroc(roc_obj) +
    theme_minimal() +
    geom_abline(slope = 1, intercept = 1, linetype = "dashed", alpha = 0.7, color = "grey") +
    coord_equal() +
    geom_ribbon(data = ci_data, aes(x = x, ymin = lower, ymax = upper), fill = "steelblue", alpha = 0.2)
}

# Plot ROC with confidence intervals
plot_roc_with_ci(roc_curve)

