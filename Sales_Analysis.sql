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