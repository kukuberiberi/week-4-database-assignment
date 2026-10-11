-- ==========================================================
-- Week 4 Database Assignment: Advanced SQL Queries and Aggregations
-- Student Name: Kuku Beriberi
-- Description: MySQL script containing aggregation, grouping, 
--              and ordering queries for business reports.
-- ==========================================================

-- ----------------------------------------------------------
-- Query 1: Five most recent cash flow snapshots (Daily Totals)
-- Purpose: Monitor immediate cash inflow by summing payment amounts per date.
-- ----------------------------------------------------------
SELECT 
    paymentDate, 
    SUM(amount) AS totalDailyAmount
FROM 
    payments
GROUP BY 
    paymentDate
ORDER BY 
    paymentDate DESC
LIMIT 5;


-- ----------------------------------------------------------
-- Query 2: Average credit metrics per customer and country (Refactored)
-- Purpose: Group by the primary key (customerNumber) alongside 
--          customerName and country to prevent data collisions from 
--          clients sharing the same name in production environments.
-- ----------------------------------------------------------
SELECT 
    customerNumber,
    customerName, 
    country, 
    AVG(creditLimit) AS averageCreditLimit
FROM 
    customers
GROUP BY 
    customerNumber, 
    customerName, 
    country;


-- ----------------------------------------------------------
-- Query 3: Financial extension of each order detail line
-- Purpose: Calculate total revenue per order line by multiplying 
--          priceEach by quantityOrdered.
-- ----------------------------------------------------------
SELECT 
    orderNumber,
    productCode,
    quantityOrdered,
    priceEach,
    (quantityOrdered * priceEach) AS totalLineAmount
FROM 
    orderdetails;


-- ----------------------------------------------------------
-- Query 4: Peak transaction extraction
-- Purpose: Find the maximum payment amount grouped by checkNumber 
--          to analyze peak transactions.
-- ----------------------------------------------------------
SELECT 
    checkNumber,
    MAX(amount) AS peakTransactionAmount
FROM 
    payments
GROUP BY 
    checkNumber;
