# Load SHAPforxgboost for model interpretation
library(SHAPforxgboost)

# Step 1: Prepare SHAP values for the XGBoost model
shap_values <- shap.prep(xgb_model, X_train = train_matrix)

# Step 2: Plot SHAP summary to visualize feature importance
shap.plot.summary(shap_values)

# Step 3: Plot top 20 most important features based on SHAP values
shap_values_extracted <- shap.values(xgb_model = xgb_model, X_train = train_matrix)
top_shap_values <- shap_values_extracted$shap_score
shap.plot.summary.wrap2(top_shap_values, train_matrix, top_n = 20)

# Step 4: Generate dependence plots for features with high SHAP importance
pdf(file = "SHAP_var_plot_age_categorized.pdf")
for (feature in shap.importance(shap_values, names_only = TRUE)) {
  plot <- shap.plot.dependence(shap_values, feature, color_feature = "auto", 
                               alpha = 0.5, jitter_width = 0.1) +
    ggtitle(paste("Dependence Plot for", feature))
  print(plot)
}
dev.off()
