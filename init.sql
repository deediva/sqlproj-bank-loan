-- Total Loan Application 
SELECT COUNT(id) AS TOTAL_LOAN_APPLICATIONS FROM  bank_loan_data;

-- MTD (Month To Date) Loan Applications
SELECT COUNT(id) AS MTD_TOTAL_LOAN_APPLICATIONS FROM  bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD(Previous Month-To-Date) LOAN APPLICATIONS
SELECT COUNT(id) AS PMTD_TOTAL_LOAN_APPLICATIONS FROM  bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) AS Total_Funded_Amount from bank_loan_data;
