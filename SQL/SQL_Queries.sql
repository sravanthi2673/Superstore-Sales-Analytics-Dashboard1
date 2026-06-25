CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

-- total sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore;

-- total profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

-- total quantity sold
SELECT SUM(Quantity) AS Total_Units
FROM superstore;

-- sales by region
SELECT Region,
       ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Region
ORDER BY Sales DESC;

-- profit by region
SELECT Region,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Region
ORDER BY Profit DESC;

-- category perfomance
SELECT Category,
       ROUND(SUM(Sales),2) AS Sales,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Category;

-- sub-category perfomance
SELECT Sub_Category,
       ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY Sub_Category
ORDER BY Sales DESC;

-- Segment Analysis
SELECT Segment,
       ROUND(SUM(Sales),2) AS Sales,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Segment;

-- States Generating Highest Sales
SELECT State,
       ROUND(SUM(Sales),2) AS Sales
FROM superstore
GROUP BY State
ORDER BY Sales DESC
LIMIT 10;

-- States with Highest Profit
SELECT State,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY State
ORDER BY Profit DESC
LIMIT 10;

-- Loss Making Sub-Categories
SELECT Sub_Category,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Sub_Category
HAVING Profit < 0
ORDER BY Profit;

-- Discount Impact
SELECT Discount,
       ROUND(SUM(Sales),2) AS Sales,
       ROUND(SUM(Profit),2) AS Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;