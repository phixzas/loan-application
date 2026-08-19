USE Loan_App
SELECT TOP 10* 
FROM loan_prediction_cleaned;
--Converting Loan_Status from bit to int for better readability.
-- 0 means Rejected and 1 means Approved.
SELECT
    Loan_Status,
    COUNT(*) AS Total
FROM loan_prediction_cleaned
GROUP BY Loan_Status;

-- Approval and Rejection Rates in percentage
SELECT
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned;

-- Approval and Rejection Rates based on Education in percentage
SELECT
    Education,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY Education
ORDER BY Approval_Rate DESC;

-- Approval and Rejection Rates based on Property Area in percentage
SELECT
    Property_Area,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY Property_Area
ORDER BY Approval_Rate DESC;

-- Approval and Rejection Rates based on Credit History in percentage
SELECT
    Credit_History,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY Credit_History
ORDER BY Approval_Rate DESC;

-- Average Income of Applicants based on Loan Status
SELECT
    CASE 
        WHEN Loan_Status = 1 THEN 'Approved'
        WHEN Loan_Status = 0 THEN 'Rejected'
    END AS Loan_Status,
    COUNT(*) AS Total_Applicants,
    ROUND(AVG(ApplicantIncome), 2) AS Avg_Applicant_Income,
    ROUND(AVG(CoapplicantIncome), 2) AS Avg_Coapplicant_Income,
    ROUND(AVG(TotalIncome), 2) AS Avg_Total_Income
FROM loan_prediction_cleaned
GROUP BY Loan_Status
ORDER BY Loan_Status DESC;

-- Average Loan Amount based on Loan Status
SELECT
    CASE 
        WHEN Loan_Status = 1 THEN 'Approved'
        WHEN Loan_Status = 0 THEN 'Rejected'
    END AS Loan_Status,
    COUNT(*) AS Total_Applicants,
    ROUND(AVG(LoanAmount), 2) AS Avg_Loan_Amount,
    ROUND(MIN(LoanAmount), 2) AS Min_Loan_Amount,
    ROUND(MAX(LoanAmount), 2) AS Max_Loan_Amount
FROM loan_prediction_cleaned
GROUP BY Loan_Status
ORDER BY Loan_Status DESC;

-- Approval and Rejection Rates based on Marital Status in percentage
SELECT
    Married,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY Married
ORDER BY Approval_Rate DESC;

-- Approval and Rejection Rates based on Number of Dependents in percentage
SELECT
    Dependents,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY Dependents
ORDER BY Dependents;


-- Approval and Rejection Rates based on Self Employment Status in percentage
SELECT
    Self_Employed,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY Self_Employed
ORDER BY Approval_Rate DESC;

-- Approval and Rejection Rates based on Gender in percentage
SELECT
    Gender,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY Gender
ORDER BY Approval_Rate DESC;

-- Approval and Rejection Rates based on Total Income in percentage
-- created a nincome group based on TotalIncome for better analysis
SELECT
    CASE
        WHEN TotalIncome < 5000 THEN 'Low Income'
        WHEN TotalIncome BETWEEN 5000 AND 10000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    COUNT(*) AS Total_Applicants,
    SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) AS Approved,
    SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) AS Rejected,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Approval_Rate,
    ROUND(
        100.0 * SUM(CASE WHEN Loan_Status = 0 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Rejection_Rate
FROM loan_prediction_cleaned
GROUP BY
    CASE
        WHEN TotalIncome < 5000 THEN 'Low Income'
        WHEN TotalIncome BETWEEN 5000 AND 10000 THEN 'Medium Income'
        ELSE 'High Income'
    END
ORDER BY Approval_Rate DESC;