USE [Ecommerce Sales DB];

SELECT *
INTO Orders
FROM orders_raw;

USE [Ecommerce Sales DB];

SELECT *
INTO Order_Details
FROM order_details_raw;

USE [Ecommerce Sales DB];

SELECT *
INTO Order_Details
FROM order_details_raw;

USE [Ecommerce Sales DB];

SELECT *
INTO Shipping
FROM shipping_raw;

SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN
(
    'Customers',
    'Products',
    'Orders',
    'Order_Details',
    'Shipping'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;

USE [Ecommerce Sales DB];

ALTER TABLE Customers
ADD CONSTRAINT PK_Customers
PRIMARY KEY (Customer_ID);

ALTER TABLE Products
ADD CONSTRAINT PK_Products
PRIMARY KEY (Product_ID);

ALTER TABLE Orders
ADD CONSTRAINT PK_Orders
PRIMARY KEY (Order_ID);

USE [Ecommerce Sales DB];

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (Customer_ID)
REFERENCES Customers(Customer_ID);

SELECT 
    tc.TABLE_NAME,
    tc.CONSTRAINT_NAME,
    tc.CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
WHERE tc.TABLE_NAME IN
(
    'Customers',
    'Products',
    'Orders',
    'Order_Details',
    'Shipping'
)
ORDER BY tc.TABLE_NAME, tc.CONSTRAINT_TYPE;
ALTER TABLE Order_Details
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (Order_ID)
REFERENCES Orders(Order_ID);

ALTER TABLE Order_Details
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (Product_ID)
REFERENCES Products(Product_ID);

ALTER TABLE Shipping
ADD CONSTRAINT FK_Shipping_Orders
FOREIGN KEY (Order_ID)
REFERENCES Orders(Order_ID);

USE [Ecommerce Sales DB];

SELECT 
    SUM(Sales) AS Total_Sales
FROM Order_Details;

USE [Ecommerce Sales DB];

SELECT 
    SUM(Profit) AS Total_Profit
FROM Order_Details;

USE [Ecommerce Sales DB];

SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Order_Details;

USE [Ecommerce Sales DB];

SELECT 
    SUM(Quantity) AS Total_Quantity_Sold
FROM Order_Details;

USE [Ecommerce Sales DB];

SELECT 
    COUNT(*) AS Total_Customers
FROM Customers;

USE [Ecommerce Sales DB];

SELECT 
    SUM(Sales) / COUNT(DISTINCT Order_ID) AS Average_Order_Value
FROM Order_Details;

USE [Ecommerce Sales DB];

SELECT 
    (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin_Percentage
FROM Order_Details;

USE [Ecommerce Sales DB];

SELECT 
    p.Category,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Order_Details od
INNER JOIN Products p
    ON od.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT 
    c.Region,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY c.Region
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT 
    c.Customer_Segment,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT 
    Payment_Mode,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Order_Details
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT 
    YEAR(o.Order_Date) AS Order_Year,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Orders o
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY YEAR(o.Order_Date)
ORDER BY Order_Year;

USE [Ecommerce Sales DB];

SELECT 
    COUNT(*) AS Missing_Order_Dates
FROM Orders
WHERE Order_Date IS NULL;

USE [Ecommerce Sales DB];

SELECT 
    YEAR(o.Order_Date) AS Order_Year,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders
FROM Orders o
WHERE o.Order_Date IS NOT NULL
GROUP BY YEAR(o.Order_Date)
ORDER BY Order_Year;

USE [Ecommerce Sales DB];

SELECT 
    YEAR(o.Order_Date) AS Order_Year,
    MONTH(o.Order_Date) AS Order_Month,
    SUM(od.Sales) AS Total_Sales
FROM Orders o
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
WHERE o.Order_Date IS NOT NULL
GROUP BY 
    YEAR(o.Order_Date),
    MONTH(o.Order_Date)
ORDER BY 
    Order_Year,
    Order_Month;

    USE [Ecommerce Sales DB];

SELECT TOP 10
    p.Product_ID,
    p.Product_Name,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Order_Details od
INNER JOIN Products p
    ON od.Product_ID = p.Product_ID
GROUP BY 
    p.Product_ID,
    p.Product_Name
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT 
    Order_Status,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Order_Status
ORDER BY Total_Orders DESC;

USE [Ecommerce Sales DB];

SELECT 
    Delivery_Status,
    COUNT(*) AS Total_Orders
FROM Shipping
GROUP BY Delivery_Status
ORDER BY Total_Orders DESC;

USE [Ecommerce Sales DB];

SELECT 
    Return_Flag,
    COUNT(*) AS Total_Orders
FROM Shipping
GROUP BY Return_Flag
ORDER BY Return_Flag;

USE [Ecommerce Sales DB];

SELECT 
    (SUM(CASE WHEN Return_Flag = 1 THEN 1 ELSE 0 END) * 100.0)
    / COUNT(*) AS Return_Rate_Percentage
FROM Shipping;

USE [Ecommerce Sales DB];

SELECT TOP 10
    c.Customer_ID,
    c.Customer_Name,
    c.Customer_Segment,
    c.Region,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name,
    c.Customer_Segment,
    c.Region
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT 
    p.Category,
    SUM(od.Quantity) AS Total_Quantity_Sold,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Order_Details od
INNER JOIN Products p
    ON od.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Quantity_Sold DESC;

USE [Ecommerce Sales DB];

SELECT 
    p.Category,
    AVG(od.Discount) * 100 AS Average_Discount_Percentage
FROM Order_Details od
INNER JOIN Products p
    ON od.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Average_Discount_Percentage DESC;

USE [Ecommerce Sales DB];

SELECT 
    o.Shipping_Mode,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Orders o
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY o.Shipping_Mode
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT 
    p.Brand,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Products p
INNER JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY p.Brand
ORDER BY Total_Sales DESC;

USE [Ecommerce Sales DB];

SELECT TOP 10
    p.Product_ID,
    p.Product_Name,
    p.Category,
    p.Brand,
    SUM(od.Profit) AS Total_Profit,
    SUM(od.Sales) AS Total_Sales
FROM Order_Details od
INNER JOIN Products p
    ON od.Product_ID = p.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name,
    p.Category,
    p.Brand
ORDER BY Total_Profit DESC;

USE [Ecommerce Sales DB];

SELECT 
    YEAR(o.Order_Date) AS Order_Year,
    MONTH(o.Order_Date) AS Order_Month,
    SUM(od.Profit) AS Total_Profit
FROM Orders o
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
WHERE o.Order_Date IS NOT NULL
GROUP BY
    YEAR(o.Order_Date),
    MONTH(o.Order_Date)
ORDER BY
    Order_Year,
    Order_Month;

    USE [Ecommerce Sales DB];

SELECT 
    c.Customer_Segment,
    SUM(od.Sales) / COUNT(DISTINCT o.Order_ID) AS Average_Order_Value
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY c.Customer_Segment
ORDER BY Average_Order_Value DESC;

USE [Ecommerce Sales DB];

SELECT 
    s.Return_Flag,
    CASE 
        WHEN s.Return_Flag = 1 THEN 'Returned'
        ELSE 'Not Returned'
    END AS Return_Status,
    COUNT(DISTINCT s.Order_ID) AS Total_Orders,
    SUM(od.Sales) AS Total_Sales,
    SUM(od.Profit) AS Total_Profit
FROM Shipping s
INNER JOIN Order_Details od
    ON s.Order_ID = od.Order_ID
GROUP BY 
    s.Return_Flag
ORDER BY 
    s.Return_Flag;


USE [Ecommerce Sales DB];

WITH CustomerOrders AS
(
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS Total_Orders
    FROM Orders
    GROUP BY Customer_ID
)
SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers
FROM CustomerOrders
GROUP BY
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END
ORDER BY Total_Customers DESC;

USE [Ecommerce Sales DB];

SELECT
    (SELECT SUM(Sales) FROM Order_Details) AS Total_Sales,

    (SELECT SUM(Profit) FROM Order_Details) AS Total_Profit,

    (SELECT COUNT(DISTINCT Order_ID) FROM Orders) AS Total_Orders,

    (SELECT SUM(Quantity) FROM Order_Details) AS Total_Quantity_Sold,

    (SELECT COUNT(*) FROM Customers) AS Total_Customers,

    (SELECT 
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
     FROM Order_Details) AS Profit_Margin_Percentage,

    (SELECT
        SUM(Sales) * 1.0 / NULLIF(COUNT(DISTINCT Order_ID), 0)
     FROM Order_Details) AS Average_Order_Value;

     USE [Ecommerce Sales DB];

SELECT
    Region,
    COUNT(*) AS Customer_Count
FROM Customers
GROUP BY Region
ORDER BY Region;

USE [Ecommerce Sales DB];

SELECT
    Customer_Segment,
    COUNT(*) AS Customer_Count
FROM Customers
GROUP BY Customer_Segment
ORDER BY Customer_Segment;

USE [Ecommerce Sales DB];

SELECT
    Payment_Mode,
    COUNT(*) AS Record_Count
FROM Order_Details
GROUP BY Payment_Mode
ORDER BY Payment_Mode;

USE [Ecommerce Sales DB];

SELECT
    Shipping_Mode,
    COUNT(*) AS Record_Count
FROM Orders
GROUP BY Shipping_Mode
ORDER BY Shipping_Mode;

USE [Ecommerce Sales DB];

SELECT
    COUNT(*) AS Missing_Order_Date
FROM Orders
WHERE Order_Date IS NULL;

USE [Ecommerce Sales DB];

SELECT
    Order_Status,
    COUNT(*) AS Record_Count
FROM Orders
GROUP BY Order_Status
ORDER BY Order_Status;

USE [Ecommerce Sales DB];

SELECT
    Delivery_Status,
    COUNT(*) AS Record_Count
FROM Shipping
GROUP BY Delivery_Status
ORDER BY Delivery_Status;