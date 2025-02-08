# Data Preprocessing
library(ROSE)
library(caret)
set.seed(987)

# Split data into training and validation sets
train_indices <- caret::createDataPartition(dat$outcome, p = 0.9, list = FALSE)
fullData <- dat[train_indices,]
validData <- dat[-train_indices,]

# Undersampling the training data
underData <- ovun.sample(outcome ~ ., 
                         data = fullData, 
                         method = "under", 
                         N = table(fullData$outcome)[1] * 2, 
                         seed = 987)$data

# Splitting undersampled data into training and testing sets
train_indices_under <- caret::createDataPartition(underData$outcome, p = 0.7, list = FALSE)
trainData <- underData[train_indices_under,]
testData <- underData[-train_indices_under,]

# Save processed datasets
save(trainData, testData, validData, file = "processed_data.RData")
