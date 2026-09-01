# Loan Approval Analysis & Prediction

## Project Overview

This project analyzes loan application data to identify the key factors associated with loan approval and develops machine learning models to predict loan approval outcomes.

The project combines data cleaning, exploratory data analysis (EDA), feature engineering, SQL analysis, machine learning, model evaluation, prediction on unseen data, model interpretation, and Power BI visualization.

The objective is to demonstrate how data analysis and machine learning can be applied to support data-driven loan assessment and decision-making.

---

## Business Problem

Financial institutions receive loan applications from customers with different demographic, financial, credit, and loan-related characteristics.

The objective of this project is to analyze historical loan application data to understand the factors associated with loan approval and develop a machine learning model capable of predicting whether a loan application is likely to be approved or rejected.

The analysis focuses on identifying important patterns in applicant characteristics, financial information, credit history, and loan details.

---

## Project Objectives

The main objectives of this project are to:

- Understand the structure and characteristics of the loan application dataset.
- Clean and prepare the data for analysis.
- Perform exploratory data analysis (EDA).
- Identify relationships between applicant characteristics and loan approval.
- Create meaningful features through feature engineering.
- Perform SQL-based analysis.
- Develop multiple machine learning classification models.
- Compare model performance using appropriate evaluation metrics.
- Select the best-performing model.
- Generate predictions on unseen loan applications.
- Interpret the most important features influencing model predictions.
- Build an interactive Power BI dashboard.
- Communicate the findings in a clear and professional format.

---

# Project Workflow

The project followed the following workflow:

1. Data Understanding
2. Data Cleaning
3. Exploratory Data Analysis (EDA)
4. Feature Engineering
5. SQL Analysis
6. Machine Learning Model Development
7. Model Evaluation and Comparison
8. Prediction on Unseen Data
9. Model Interpretation
10. Power BI Dashboard
11. Project Documentation for GitHub

---

# 1. Data Understanding

The dataset contains information about loan applicants, including demographic characteristics, income, loan amount, loan term, credit history, property area, and loan approval status.

The main variables include:

- Loan_ID
- Gender
- Married
- Dependents
- Education
- Self_Employed
- ApplicantIncome
- CoapplicantIncome
- LoanAmount
- Loan_Amount_Term
- Credit_History
- Property_Area
- Loan_Status

The target variable is:

- `Loan_Status`

where:

- `Y` represents an approved loan.
- `N` represents a rejected loan.

The training dataset contains **614 loan applications**.

---

# 2. Data Cleaning

The dataset was examined for missing values, incorrect data types, and inconsistencies.

The following steps were performed:

- Inspected the structure of the dataset.
- Checked for missing values.
- Examined duplicate records.
- Handled missing values in relevant variables.
- Converted variables into appropriate data types.
- Prepared categorical variables for machine learning.
- Checked the cleaned dataset before modeling.

The objective of the cleaning process was to ensure that the dataset was suitable for exploratory analysis and machine learning.

---

# 3. Exploratory Data Analysis (EDA)

Exploratory data analysis was performed to understand the distribution of the variables and identify relationships between applicant characteristics and loan approval.

The analysis examined factors including:

- Gender
- Marital status
- Number of dependents
- Education
- Self-employment status
- Applicant income
- Coapplicant income
- Loan amount
- Loan term
- Credit history
- Property area

### Key Findings

Credit history showed a strong relationship with loan approval.

Education and property area also showed differences in approval outcomes.

Married applicants generally showed higher approval rates than unmarried applicants.

Gender and self-employment showed comparatively smaller differences in loan approval.

Applicant income and coapplicant income showed variation across applicants.

Loan amount showed relatively similar median values between approved and rejected applications.

The loan term was concentrated around **360 months**.

These findings were used to guide the feature engineering and machine learning stages.

---

# 4. Feature Engineering

Additional features were created to provide the machine learning models with more useful information.

The following features were created:

### TotalIncome

Combines applicant income and coapplicant income.

```text
TotalIncome = ApplicantIncome + CoapplicantIncome
LoanIncomeRatio = LoanAmount / TotalIncome
LoanTermYears = Loan_Amount_Term / 12

SQL Analysis

SQL was used to perform additional analysis of the loan application data.

The SQL analysis focused on understanding loan approval patterns and applicant characteristics.

Examples of the analysis included:

Loan approval distribution.
Approval patterns across applicant characteristics.
Credit history and loan approval.
Education and property area comparisons.
Applicant income and loan characteristics.
Grouping and aggregation of loan application data.

SQL was used as an additional analytical tool alongside Python and Power BI.

6. Machine Learning Model Development

The problem was treated as a binary classification task.

The target variable was encoded as:

Y = 1
N = 0

The dataset was divided into training and testing sets using an 80/20 split.

A random_state of 42 was used to make the results reproducible.

Stratified splitting was also used to maintain the class distribution between the training and testing datasets.

Five machine learning algorithms were developed and evaluated:

Logistic Regression
Decision Tree
Random Forest
K-Nearest Neighbors
Support Vector Machine
7. Model Evaluation and Comparison

The models were evaluated using:

Accuracy
Precision
Recall
F1-Score
ROC-AUC
Model Performance
Model	Accuracy	Precision	Recall	F1-Score	ROC-AUC
Logistic Regression	67.48%	70.64%	90.59%	79.38%	75.98%
Decision Tree	69.11%	80.52%	72.94%	76.54%	66.73%
Random Forest	82.93%	87.21%	88.24%	87.72%	83.68%
K-Nearest Neighbors	70.73%	74.75%	87.06%	80.43%	68.61%
Support Vector Machine	74.80%	75.96%	92.94%	83.60%	82.23%
Best Model

The Random Forest Classifier achieved the strongest overall performance.

It achieved:

Accuracy: 82.93%
Precision: 87.21%
Recall: 88.24%
F1-Score: 87.72%
ROC-AUC: 83.68%

Although the Support Vector Machine achieved a higher recall, Random Forest provided the strongest overall balance across the evaluation metrics.

Therefore, Random Forest was selected as the final model.

8. Prediction on Unseen Data

After selecting Random Forest as the final model, it was used to generate predictions for unseen loan applications.

The unseen dataset contained 367 applications.

The unseen data was processed using the same feature engineering and encoding approach applied to the training data.

The final Random Forest model was then used to predict whether each unseen application was likely to be approved or rejected.

Because the unseen dataset does not contain the actual loan approval outcomes, the predictions cannot be directly evaluated for accuracy.

9. Model Interpretation

Feature importance was used to understand which variables contributed most to the Random Forest model's predictions.

Feature Importance
Feature	Importance
Credit_History	0.211668
TotalIncomeLog	0.201633
LoanIncomeRatio	0.180605
LoanAmountLog	0.171098
Dependents	0.052537
LoanTermYears	0.046287
Property_Area_Semiurban	0.028528
Education_Not Graduate	0.023643
Property_Area_Urban	0.021900
Married_Yes	0.021731
Self_Employed_Yes	0.021206
Gender_Male	0.019163
Key Interpretation

Credit_History was the most influential feature in the Random Forest model, followed by TotalIncomeLog, LoanIncomeRatio, and LoanAmountLog.

This indicates that credit and financial characteristics played an important role in the model's predictions.

Demographic variables such as gender, marital status, and self-employment had comparatively lower feature importance in the final model.

Feature importance indicates which variables were useful to the model for prediction; it does not by itself establish a causal relationship between a feature and loan approval.

10. Power BI Dashboard

An interactive Power BI dashboard was developed to communicate the major findings from the analysis.

The dashboard provides an overview of loan applications and allows users to explore approval patterns across different applicant characteristics.

Key Performance Indicators

The dashboard contains the following KPIs:

Total Applications: 614
Approved Applications: 422
Rejected Applications: 192
Approval Rate: 68.73%

The overall approval rate is calculated as:

422 / 614 × 100 = 68.73%
Dashboard Analysis

The dashboard includes visualizations for:

Approval Rate by Gender
Approval Rate by Credit History
Loan Approval Distribution
Approval Rate by Property Area
Loan Amount vs Total Income by Loan Status
Approval Rate by Education

Interactive slicers were also added for:

Gender
Married
Education
Credit History
Self-Employed
Property Area

The dashboard was designed to provide a clear visual summary of the loan approval patterns identified during the analysis.

11. Key Insights

The analysis produced several important insights:

1. Credit History is highly important

Credit history was the most important feature in the Random Forest model, with an importance score of approximately 21.17%.

2. Financial characteristics matter

TotalIncomeLog, LoanIncomeRatio, and LoanAmountLog were among the most important features used by the model.

3. Overall approval rate

Out of 614 applications:

422 were approved.
192 were rejected.

This resulted in an overall approval rate of 68.73%.

4. Education differences

The Power BI analysis showed different approval rates between graduate and non-graduate applicants.

5. Property area differences

Approval rates also varied across rural, semiurban, and urban property areas.

6. Random Forest performed best overall

Random Forest achieved an accuracy of 82.93% and an F1-score of 87.72%, making it the strongest overall model tested in this project.

12. Conclusion

This project demonstrated how data analysis, SQL, machine learning, and business intelligence can be combined to analyze loan applications and develop a predictive model.

The analysis began with data understanding and cleaning, followed by exploratory data analysis and feature engineering.

SQL was then used for additional analysis, while several machine learning classification algorithms were developed and compared.

Among the evaluated models, Random Forest provided the strongest overall performance and was selected as the final model.

The model achieved an accuracy of 82.93%, precision of 87.21%, recall of 88.24%, F1-score of 87.72%, and ROC-AUC of 83.68%.

Feature importance analysis identified Credit History, Total Income, Loan Income Ratio, and Loan Amount as some of the most influential variables.

Finally, the results were presented through an interactive Power BI dashboard, providing a business-friendly way to explore loan approval patterns.

13. Limitations

This project has several limitations:

The training dataset contains a relatively limited number of observations.
The unseen dataset does not contain actual loan-status outcomes, so its predictions cannot be directly evaluated.
Feature importance does not establish causal relationships.
Historical patterns in the dataset may not necessarily represent future lending behavior.
Further validation would be required before applying the model in a real-world lending environment.
14. Future Improvements

Future improvements could include:

Hyperparameter tuning of the machine learning models.
Cross-validation for more robust model evaluation.
Testing additional classification algorithms.
Exploring advanced ensemble methods.
Performing more detailed model explainability using techniques such as SHAP.
Collecting larger and more recent loan application data.
Monitoring model performance after deployment.
Developing a web application for real-time loan prediction.
Adding automated data pipelines for future loan applications.
15. Tools & Technologies

The following tools and technologies were used:

Python
Jupyter Notebook
Pandas
NumPy
Matplotlib
Scikit-learn
SQL
SQL Server / SSMS
Power BI
Git
GitHub
loan-approval-analysis/
│
├── README.md
│
├── notebooks/
│   └── Loan_Approval_Analysis.ipynb
│
├── data/
│   ├── train.csv
│   └── test.csv
│
├── sql/
│   └── loan_analysis.sql
│
├── powerbi/
│   └── Loan_Model_Visualization.pbix
│
├── outputs/
│   ├── loan_predictions.csv
│   ├── random_forest_final_results.csv
│   └── random_forest_feature_importance.csv
│
└── images/
    └── loan_dashboard.png


    Author

Olusanjo Mayowa Philips

Data Analyst | Data Science Enthusiast

This project was developed as part of my data analytics and machine learning portfolio.