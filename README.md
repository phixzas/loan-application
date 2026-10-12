# Loan Approval Prediction - End-to-End ML System

🚀 **Live Demo:** https://loan-application-detmk7hpt9fwsljudnayal.streamlit.app/
📊 **Dashboard:** Power BI | 🧠 **Model:** Random Forest (82.93% Accuracy)

> An end-to-end machine learning system that predicts loan approval probability to support data-driven lending decisions.

### Business Problem
Financial institutions need to assess loan applications quickly and consistently. This project analyzes 614 historical applications to predict approval outcome (Approved/Rejected) based on applicant demographic, financial, and credit features.

### Solution Architecture
`Data Ingestion → Cleaning → EDA → Feature Engineering → SQL Analysis → Model Training (5 models) → Evaluation → Deployment (Streamlit) → BI Dashboard`

### Key Results

| Model | Accuracy | Precision | Recall | F1 | ROC-AUC |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Random Forest (Final)** | **82.93%** | **87.21%** | **88.24%** | **87.72%** | **83.68%** |
| Logistic Regression | 67.48% | 70.64% | 90.59% | 79.38% | 75.98% |
| SVM | 74.80% | 75.96% | 92.94% | 83.60% | 82.23% |

**Top 3 Drivers:** `Credit_History (21.1%)`, `TotalIncomeLog (20.1%)`, `LoanIncomeRatio (18.0%)`
**Overall Approval Rate:** 68.73% (422 Approved / 192 Rejected)

### Tech Stack
- **Python:** Pandas, NumPy, Scikit-learn, Matplotlib
- **ML:** Logistic Regression, Decision Tree, Random Forest, KNN, SVM
- **Deployment:** Streamlit Cloud, Git, GitHub
- **Analytics:** SQL Server, Power BI
- **Concepts:** Feature Engineering, Model Interpretation, Stratified Split

### Project Structure