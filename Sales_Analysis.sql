USE E_Commerce_Sales;

SELECT*
FROM Sales;

--Sales by region
SELECT Region, SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM Sales
GROUP BY Region
ORDER BY Total_Quantity_Sold DESC;

--Top selling products
SELECT Product_Name, SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM Sales
GROUP BY Product_Name
ORDER BY Total_Quantity_Sold DESC;

--Top selling catgories
SELECT Category, SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM Sales
GROUP BY Category
ORDER BY Total_Quantity_Sold DESC;

--Sales per month
SELECT YEAR(Transaction_Date) AS Year, MONTH(Transaction_Date) AS Month, SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM Sales
GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date)
ORDER BY Year, Month;

--Purchase frequency by gender
SELECT 
    Customer_Gender, 
    COUNT(Transaction_ID) AS Purchase_Frequency
FROM Sales
GROUP BY Customer_Gender
ORDER BY Purchase_Frequency DESC;

--Purchase frequency by age groups
SELECT 
    CASE 
        WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Customer_Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+' 
    END AS Age_Group, 
    COUNT(Transaction_ID) AS Purchase_Frequency
FROM Sales
GROUP BY 
    CASE 
        WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Customer_Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+' 
    END
ORDER BY Purchase_Frequency DESC;

--Purchase frequency by membership status
SELECT 
    Membership_Status, 
    COUNT(Transaction_ID) AS Purchase_Frequency
FROM Sales
GROUP BY Membership_Status
ORDER BY Purchase_Frequency DESC;
