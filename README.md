# README: AI Prediction Models for Chronic Medication and COVID-19 Outcomes

## Project Overview
This repository contains the supplementary code and data for the research article:

**Title:** A Machine Learning Model Exploring the Relationship Between Chronic Medication and COVID-19 Clinical Outcomes  
**Journal:** International Journal of Clinical Pharmacy  
**Running Head:** AI Prediction Models for Chronic Medication and COVID-19  

### **Abstract Summary**
This study investigates the impact of chronic medication on COVID-19 outcomes using machine learning techniques. We analyze data from **137,835** COVID-19 patients in Catalonia (Feb–Sep 2020) with **Extreme Gradient Boosting (XGBoost)** to predict hospitalisation, ICU admission, and mortality risks. Key findings include:
- **Best-performing model:** Mortality prediction for **18 to 65-year-olds (AUCROC 0.92)**.
- **Key predictors:** Number of prescribed drugs, systemic corticoids, HMG-CoA reductase, and hypertension medications.
- **Protective effects:** ACE inhibitors (ACEi), angiotensin receptor blockers (ARBs), and biguanides (metformin).

## Repository Contents
This repository includes the scripts required to preprocess data, train machine learning models, and evaluate results:

```
📂 project-supplementary-code
│── 📄 README.md              # Project documentation
│── 📄 data_preprocessing.R    # Data preparation and feature engineering
│── 📄 model_training.R        # Training XGBoost models with hyperparameter tuning
│── 📄 model_results.csv       # Results from hyperparameter tuning
│── 📄 prediction.R            # Generating predictions from trained models
```

## Setup Instructions
To run the code, ensure you have R installed with the required packages:
```r
install.packages(c("caret", "xgboost", "ROSE", "dplyr"))
```

### **Step-by-Step Execution**
1. **Data Preprocessing** (`data_preprocessing.R`)
   - Loads patient data and splits it into **training (70%)** and **testing (30%)** sets.
   - Applies **undersampling** to handle class imbalance.
   - Saves processed datasets for reproducibility.

2. **Model Training** (`model_training.R`)
   - Trains **Extreme Gradient Boosting (XGBoost) models** for mortality prediction.
   - Performs **cross-validation (10-fold)** and **grid search** for hyperparameter tuning.
   - Saves the best-performing model.

3. **Prediction** (`prediction.R`)
   - Loads the trained model.
   - Applies it to the test dataset to generate predictions.
   - Saves results as `predictions.csv`.

## Key Findings and Contributions
- **ML-driven models effectively predict** COVID-19 **hospitalisation, ICU admission, and death.**
- **ACEi, ARBs, and metformin** were associated with lower mortality risk, supporting continued use.
- **Scalable approach** for AI-driven analysis of healthcare data.

## Citation
If you use this repository for your research, please cite:
TBC

## Contact
For questions or collaborations, please contact **Berta Miro** at **berta.miro@vhir.org**.




