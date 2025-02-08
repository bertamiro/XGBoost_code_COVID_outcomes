# Compute feature importance using XGBoost
importance_matrix <- xgb.importance(feature_names = colnames(train_matrix), model = xgb_model)

# Visualize feature importance
xgb.plot.importance(importance_matrix)
