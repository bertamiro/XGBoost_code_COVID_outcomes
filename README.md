# README

## A Machine Learning Model Exploring the Relationship Between Chronic Medication and COVID-19 Clinical Outcomes

# ### Journal: International Journal of Clinical Pharmacy  
# Running head: AI Prediction Models for Chronic Medication and COVID-19  

### Keywords
COVID-19; machine learning; mortality; prediction models; polypharmacy; metformin; HMG-CoA reductase; ACE inhibitors; ARBs  

---

## Overview
This repository contains the code and datasets used for the study "A Machine Learning Model Exploring the Relationship Between Chronic Medication and COVID-19 Clinical Outcomes." The study investigates the role of chronic medication in COVID-19 outcomes using machine learning models.

## Abstract
### Background
The impact of chronic medication on COVID-19 outcomes has been debated since the onset of the pandemic. Understanding how specific long-term treatments influence infection severity is crucial for optimizing patient care.

### Aim
To explore the association between chronic medication and COVID-19 outcomes, using machine learning to identify key medication-related factors influencing hospital admission, ICU admission, and mortality risk.

### Methods
- Data from 137,835 COVID-19 patients in Catalonia (February–September 2020).
- Machine Learning algorithm: Extreme Gradient Boosting (XGBoost).
- Outcomes: hospitalisation, ICU admission, and mortality.
- Model evaluation: Area Under the Curve - Receiver Operating Characteristic (AUC-ROC).
- Feature importance and SHAP analysis.

### Results
- Mean age: 53 years, 57% female.
- The best model predicted death risk in 18-65-year-olds (AUC-ROC: 0.92).
- Key predictors: Number of prescribed drugs, systemic corticosteroids, HMG-CoA reductase inhibitors, hypertension medications.
- Sensitivity analysis:
  - Participants >65 years on ACE inhibitors (ACEi) or ARBs had lower mortality risk (OR=0.78).
  - Dipeptidyl peptidase-4 inhibitors were linked to increased mortality in 18-65-year-olds.
  - Biguanides (metformin) were protective for >65-year-olds (OR=0.79).

### Conclusion
Machine learning models effectively distinguished COVID-19 outcomes, supporting continued use of ACEi, ARBs, and biguanides for hypertension and diabetes patients.

---

## Code and Analysis
This repository includes:
1. **Data Preprocessing**: Cleaning and structuring input data.
2. **Model Training**:
   - XGBoost implementation with hyperparameter tuning.
   - Model performance evaluation using AUC-ROC.
3. **Feature Importance Analysis**:
   - XGBoost feature importance plots.
   - SHAP (SHapley Additive exPlanations) analysis.
4. **Visualization**:
   - Confusion matrices.
   - ROC curves with confidence intervals.
   - SHAP summary and dependence plots.

## Installation and Dependencies
To run the analysis, install the required R packages:

```r
install.packages(c("xgboost", "SHAPforxgboost", "shapviz", "pROC", "ggplot2", "caret"))
```

## Running the Analysis
1. Load and preprocess data.
2. Train XGBoost models with different parameter settings.
3. Evaluate model performance using accuracy, AUC, and confidence intervals.
4. Generate feature importance and SHAP visualizations.

## Key Scripts
- `data_preprocessing.R` – Data preparation.
- `model_training.R` – XGBoost model training and evaluation.
- `prediction_modelperformance.R` - Prediction and model performance measures
- `feature_importance.R` – Feature importance and SHAP analysis.
- `SHAPmodel_interpretation.R` – Performance and interpretability plots.

## Results Interpretation
- **Feature Importance**: Identifies top predictors of COVID-19 outcomes.
- **SHAP Analysis**: Provides individual prediction explanations.
- **ROC Curves**: Measures classification performance.

## Citation
If using this code, please cite:
TBC

## License
This project is licensed under the MIT License.

---

## Contact
For questions or collaborations, contact [berta.miro@vhir.org].

