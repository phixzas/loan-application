import streamlit as st
import pickle
import numpy as np
import os

base_path = os.path.dirname(__file__)
model_path = os.path.join(base_path, 'model.pkl')
model = pickle.load(open(model_path, 'rb'))

st.title("Loan Approval Predictor")
st.write("Professional loan eligibility checker")

st.markdown(
    """
    <style>
    div.stButton > button {
        display: block;
        margin: 0 auto;
        width: 220px;
        height: 52px;
        font-size: 22px;
        font-weight: 700;
        border-radius: 12px;
        background: linear-gradient(90deg, #1f77b4 0%, #4caf50 100%);
        color: white;
        border: none;
    }
    div.stButton > button:hover {
        transform: scale(1.02);
    }
    .stSuccess, .stError {
        font-size: 1.25rem;
        padding: 1rem 1.2rem;
        border-radius: 0.75rem;
    }
    div[data-testid="stNumberInputRoot"] {
        position: relative;
    }
    div[data-testid="stNumberInputRoot"] > label {
        display: block;
    }
    div[data-testid="stNumberInputRoot"] input {
        padding-left: 26px;
    }
    div[data-testid="stNumberInputRoot"]::before {
        content: "$";
        position: absolute;
        left: 12px;
        top: 52%;
        transform: translateY(-50%);
        font-weight: 700;
        color: #4b5563;
        z-index: 1;
        pointer-events: none;
    }
    </style>
    """,
    unsafe_allow_html=True,
)

def currency_input(label, default_value=0.0):
    value = st.text_input(label, value=f"${default_value:,.0f}", placeholder="$0")
    cleaned = value.replace("$", "").replace(",", "").strip()
    if cleaned == "":
        return 0.0
    try:
        return float(cleaned)
    except ValueError:
        st.error(f"{label}: please enter a valid dollar amount.")
        st.stop()

# Professional inputs
applicant_income = currency_input("Applicant Income", 0.0)
coapplicant_income = currency_input("Coapplicant Income", 0.0)
loan_amount = currency_input("Loan Amount Requested", 100000.0)
loantermyears = st.number_input("Loan Term (in Years)", min_value=1, max_value=400, value=1, step=1, format="%d")
dependents_option = st.selectbox("Number of Dependents", ["Select Number of Dependents", "0", "1", "2", "3+"])

credit_history = st.selectbox("Credit History", ["Select Credit History", "Good (1)", "Bad (0)", "Don't have (-1)"])
gender = st.selectbox("Gender", ["Select Gender", "Male", "Female"])
married = st.selectbox("Married?", ["Select Marital Status", "Yes", "No"])
education = st.selectbox("Education", ["Select Education", "Graduate", "Not Graduate"])
self_employed = st.selectbox("Self Employed?", ["Select Employment Status", "Yes", "No"])
property_area = st.selectbox("Property Area", ["Select Property Area", "Rural", "Semiurban", "Urban"])

if st.button("Predict"):
    required_fields = {
        "Number of Dependents": dependents_option,
        "Credit History": credit_history,
        "Gender": gender,
        "Married": married,
        "Education": education,
        "Self Employed": self_employed,
        "Property Area": property_area,
    }

    for label, value in required_fields.items():
        if value.startswith("Select"):
            st.error(f"Please choose an option for: {label}.")
            st.stop()

    total_income = applicant_income + coapplicant_income
    total_income_log = np.log1p(total_income)
    loan_income_ratio = loan_amount / total_income if total_income > 0 else 0.0
    loan_amount_log = np.log1p(loan_amount)

    # Match the exact feature order used in training
    dependents = 3 if dependents_option == "3+" else int(dependents_option)
    if credit_history == "Good (1)":
        credit_history_val = 1
    elif credit_history == "Bad (0)":
        credit_history_val = 0
    else:
        credit_history_val = -1
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
        st.success(f"✅ LOAN APPROVED! Confidence: {proba*100:.1f}%")
    else:
        st.error(f"❌ LOAN NOT APPROVED! Confidence: {(1-proba)*100:.1f}%")