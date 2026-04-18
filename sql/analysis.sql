-- Query 1: Sales and Profit by Region
SELECT Region, 
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Query 2: Most Loss-Making Product Sub-Categories
SELECT Category, Sub_Category,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       ROUND(AVG("Profit Margin %"), 2) AS Avg_Margin
FROM sales
GROUP BY Category, Sub_Category
ORDER BY Total_Profit ASC
LIMIT 10;

-- Query 3: Top 10 Customers by Revenue
SELECT "Customer Name",
       ROUND(SUM(Sales), 2) AS Total_Revenue,
       COUNT(DISTINCT "Order ID") AS Total_Orders
FROM sales
GROUP BY "Customer Name"
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Query 4: Year Over Year Sales Trend
SELECT "Order Year",
       ROUND(SUM(Sales), 2) AS Annual_Sales,
       ROUND(SUM(Profit), 2) AS Annual_Profit
FROM sales
GROUP BY "Order Year"
ORDER BY "Order Year";

-- Query 5: Average Delivery Days by Ship Mode
SELECT "Ship Mode",
       ROUND(AVG("Delivery Days"), 1) AS Avg_Delivery_Days,
       COUNT(*) AS Total_Orders
FROM sales
GROUP BY "Ship Mode"
ORDER BY Avg_Delivery_Days;