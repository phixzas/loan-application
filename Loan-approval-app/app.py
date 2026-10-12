import streamlit as st
import pickle
import numpy as np

model = pickle.load(open('model.pkl', 'rb'))

st.title("Loan Approval Predictor")
st.write("Professional loan eligibility checker")

# Professional inputs
applicant_income = st.number_input("Applicant Income", min_value=0.0, value=20000.0, step=1000.0, format="%.0f")
coapplicant_income = st.number_input("Coapplicant Income", min_value=0.0, value=0.0, step=1000.0, format="%.0f")
loan_amount = st.number_input("Loan Amount Requested", min_value=50.0, value=50000.0, step=1000.0, format="%.0f")
loantermyears = st.number_input("Loan Term (in Years)", min_value=1, max_value=400, value=5, step=1, format="%d")
dependents_option = st.selectbox("Number of Dependents", ["0", "1", "2", "3+"])

credit_history = st.selectbox("Credit History", ["Good (1)", "Bad (0)", "Don't have (-1)"])
gender = st.selectbox("Gender", ["Male", "Female"])
married = st.selectbox("Married?", ["Yes", "No"])
education = st.selectbox("Education", ["Graduate", "Not Graduate"])
self_employed = st.selectbox("Self Employed?", ["Yes", "No"])
property_area = st.selectbox("Property Area", ["Rural", "Semiurban", "Urban"])

if st.button("Predict"):
    total_income = applicant_income + coapplicant_income
    total_income_log = np.log1p(total_income)
    loan_income_ratio = loan_amount / total_income if total_income > 0 else 0.0
    loan_amount_log = np.log1p(loan_amount)

    # Match the exact feature order used in training
    dependents = 3 if dependents_option == "3+" else int(dependents_option)
    credit_history_val = 1 if "Good" in credit_history else 0
    gender_male = 1 if gender == "Male" else 0
    married_yes = 1 if married == "Yes" else 0
    education_not_graduate = 1 if education == "Not Graduate" else 0
    self_employed_yes = 1 if self_employed == "Yes" else 0
    property_area_semiurban = 1 if property_area == "Semiurban" else 0
    property_area_urban = 1 if property_area == "Urban" else 0

    features = np.array([[dependents, total_income_log, loan_income_ratio,
                          loan_amount_log, float(loantermyears), credit_history_val,
                          gender_male, married_yes, education_not_graduate,
                          self_employed_yes, property_area_semiurban,
                          property_area_urban]], dtype=float)

    prediction = model.predict(features)[0]
    proba = model.predict_proba(features)[0][1]

    if prediction == 1:
        st.success(f"✅ Loan APPROVED! Confidence: {proba*100:.1f}%")
    else:
        st.error(f"❌ Loan NOT APPROVED. Confidence: {(1-proba)*100:.1f}%")