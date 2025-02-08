# ==============================================================================
# Data Preprocessing for COVID-19 ML Model
# - Splits data into training and validation sets
# - Applies undersampling to balance classes
# - Saves processed datasets for further analysis
# ==============================================================================

# Load required libraries
library(ROSE)
library(caret)

# Set seed for reproducibility
set.seed(987)

# Load dataset (ensure `dat` is available in your environment)
if (!exists("dat")) {
  stop("Error: Dataset `dat` not found. Please load it before running this script.")
}

# Split data into training (90%) and validation (10%) sets
train_indices <- createDataPartition(dat$outcome, p = 0.9, list = FALSE)
train_full <- dat[train_indices,]
valid_data <- dat[-train_indices,]

# Perform undersampling on the training set to balance the classes
under_data <- ovun.sample(outcome ~ ., 
                          data = train_full, 
                          method = "under", 
                          N = table(train_full$outcome)[1] * 2, 
                          seed = 987)$data

# Further split undersampled data into training (70%) and testing (30%) sets
train_indices_under <- createDataPartition(under_data$outcome, p = 0.7, list = FALSE)
train_data <- under_data[train_indices_under,]
test_data <- under_data[-train_indices_under,]

# Save processed datasets
save(train_data, test_data, valid_data, file = "data/processed_data.RData")

# Print summary
cat("Data preprocessing completed successfully.\n")
cat(sprintf("Training set: %d samples\n", nrow(train_data)))
cat(sprintf("Testing set: %d samples\n", nrow(test_data)))
cat(sprintf("Validation set: %d samples\n", nrow(valid_data)))
