-- Total Loan Application 
SELECT COUNT(id) AS TOTAL_LOAN_APPLICATIONS FROM  bank_loan_data;

-- MTD (Month-To-Date) Loan Applications
SELECT COUNT(id) AS MTD_TOTAL_LOAN_APPLICATIONS FROM  bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD(Previous Month-To-Date) LOAN APPLICATIONS
SELECT COUNT(id) AS PMTD_TOTAL_LOAN_APPLICATIONS FROM  bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) AS Total_Funded_Amount from bank_loan_data;

-- MTD(Month-To-Date) FUNDED AMOUNT
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD(Previous Month_To-Date) FUNDED AMOUNT
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- TOTAL AMOUNT RECEIVED
SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data;

-- MTD(Month-To-Date) TOTAL AMOUNT RECEIVED
SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD(Previous Month-To-Date) TOTAL AMOUNT RECEIVED
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- AVERAGE INTEREST RATE
SELECT ROUND(AVG(int_rate), 4) * 100 AS AVG_INTEREST_RATE FROM bank_loan_data;

-- MTD(Month-To-Date) AVERAGE INTEREST RATE
SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_AVG_INTEREST_RATE FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD(Previous Month-To-Date) AVERAGE INTEREST RATE
SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_AVG_INTEREST_RATE FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

-- AVERAGE Debt-to-Income Ratio (DTI)
SELECT ROUND(AVG(dti),4) * 100 AS AVG_DTI FROM bank_loan_data;

-- MTD(Month-To-Date) AVERAGE Debt-to-Income Ratio (DTI)
SELECT ROUND(AVG(dti),4) * 100 AS MTD_AVG_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD(Previous Month-To-Date) AVERAGE Debt-to-Income Ratio (DTI)
SELECT ROUND(AVG(dti),4) * 100 AS PMTD_AVG_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--  GOOD LOAN APPLICATION PERCENTAGE
SELECT (COUNT (CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
/
COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data;

-- GOOD LOAN APPLICATIONS
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- GOOD LOAN FUNDED AMOUNT
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- GOOD LOAN TOTAL RECEIVED AMOUNT
SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Bad Loan Percentage
SELECT
(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) *100.0) / 
COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;

-- Bad Loan Applications
 SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_Amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- LOAN STATUS
SELECT 
      loan_status,
     COUNT(id) AS LoanCount,
     SUM(total_payment) AS Total_Amount_Received,
     SUM(loan_amount) AS Total_Funded_Amount,
     AVG(int_rate * 100) AS Interest_Rate,
     AVG(dti * 100) AS DTI
 FROM 
    bank_loan_data
 GROUP BY 
   loan_status;

-- MTD Loan Status
SELECT
      loan_status,
	  SUM(total_payment) AS MTD_Total_Amount_Received,
	  SUM(loan_amount) AS MTD_Total_Funded_Amount
  FROM bank_loan_data
  WHERE MONTH(issue_date) = 12
  GROUP BY loan_status

  -- MONTHLY TRENDS BY ISSUE DATE
  SELECT
      MONTH(issue_date) AS Month_Number,
      DATENAME(MONTH, issue_date) AS Month_Name,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date) , DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date) ;

-- REGIONAL ANALYSIS BY STATE
SELECT
      address_state,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state ;

-- LOAN TERM ANALYSIS
SELECT 
      term,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term

-- EMPLOYEE LENGTH ANALYSIS
SELECT 
      emp_length,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;

-- LOAN PURPOSE BREAKDOWN
SELECT 
      purpose,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC ;

-- HOME OWNERSHIP ANALYSIS
SELECT 
      home_ownership,
	  COUNT(id) AS Total_Loan_Applications,
	  SUM(loan_amount) AS Total_Funded_Amount,
	  SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC ;

-- 




