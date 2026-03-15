SELECT COUNT(*) FROM EV_Dataset;
SELECT 
    State,
    ROUND(SUM(EV_Sales_Quantity)) AS total_ev_sales
FROM EV_Dataset
GROUP BY State
ORDER BY total_ev_sales DESC
LIMIT 10;
SELECT 
    CAST(Year AS INT) AS year,
    ROUND(SUM(EV_Sales_Quantity)) AS total_ev_sales,
    ROUND(SUM(EV_Sales_Quantity) - LAG(SUM(EV_Sales_Quantity)) 
    OVER (ORDER BY Year)) AS growth_from_last_year
FROM EV_Dataset
GROUP BY Year
ORDER BY Year;
SELECT 
    Vehicle_Category,
    ROUND(SUM(EV_Sales_Quantity)) AS total_sales,
    ROUND(SUM(EV_Sales_Quantity) * 100.0 / 
    (SELECT SUM(EV_Sales_Quantity) FROM EV_Dataset), 2) AS percentage
FROM EV_Dataset
GROUP BY Vehicle_Category
ORDER BY total_sales DESC;
SELECT 
    State,
    ROUND(SUM(EV_Sales_Quantity)) AS total_2w_sales
FROM EV_Dataset
WHERE Vehicle_Category = '2-Wheelers'
GROUP BY State
ORDER BY total_2w_sales DESC
LIMIT 5;
SELECT 
    Month_Name,
    ROUND(SUM(EV_Sales_Quantity)) AS total_sales
FROM EV_Dataset
GROUP BY Month_Name
ORDER BY total_sales DESC;
