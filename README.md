# Ecommerce Sales Analysis

## Project Overview

This project analyzes ecommerce sales data using Python, SQL Server, and Power BI.

The project focuses on sales performance, profitability, customers, products,
regions, customer segments, payment modes, shipping, delivery status, and returns.

The objective is to identify meaningful business patterns and generate
data-driven insights for reporting and business analysis.

---

## Tools & Technologies

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- SQL Server
- SQL
- Power BI
- Jupyter Notebook
- VS Code

---

## Database Tables

The analysis uses five relational tables:

1. Customers
2. Products
3. Orders
4. Order_Details
5. Shipping

The tables were connected through primary key and foreign key relationships
in SQL Server.

---

## Python Analysis

Python was connected to SQL Server using SQLAlchemy and pyodbc.

The Python analysis included:

- Data loading
- Data validation
- Data type checking
- Missing value analysis
- Data quality checking
- KPI calculation
- Category analysis
- Region analysis
- Customer segment analysis
- Payment mode analysis
- Year-wise analysis
- Monthly sales and profit analysis
- Top 10 product analysis
- Order status analysis
- Delivery status analysis
- Shipping mode analysis
- Return analysis
- Business insights
- Data visualization

---

## Key KPIs

- Total Sales: INR 6,895,729,728.44
- Total Profit: INR 1,883,990,896.40
- Total Orders: 60,000
- Total Quantity: 181,896
- Total Customers: 12,000
- Profit Margin: 27.32%
- Average Order Value: INR 114,928.83

---

## Key Business Insights

- Home & Kitchen generated the highest sales among the product categories.
- North region recorded the highest sales and profit.
- Consumer customers contributed the largest share of sales and profit.
- UPI was the most frequently used payment mode by order count.
- Standard shipping was the most commonly used shipping mode with 26,526 orders.
- 43,229 orders were delivered on time.
- 9,594 orders were delayed.
- 5,969 orders were returned, representing approximately 9.95% of shipping orders.
- Sales and profit showed variation across the 2022 to 2025 period.

---

## Data Quality

The dataset was checked for missing values, duplicate records,
and inconsistent categorical values.

Important observations included:

- 80 missing Order_Date values
- 2,933 missing Shipping_Mode values
- 2,384 missing Payment_Mode values
- 909 missing Sales values
- 909 missing Profit values
- 7 missing Product Unit_Price values

Selected categorical values were standardized in Python.

Missing values were retained where appropriate instead of being replaced
with assumed values.

---

## Visualizations

The Python notebook contains 17 visualizations covering:

- Monthly Sales Trend
- Monthly Profit Trend
- Sales by Category
- Profit by Category
- Sales by Region
- Profit by Region
- Sales by Customer Segment
- Profit by Customer Segment
- Sales by Payment Mode
- Top 10 Products by Sales
- Top 10 Products by Profit
- Return Status Analysis
- Delivery Status Analysis
- Shipping Mode Analysis
- Sales by Return Status
- Profit by Return Status
- Profit Margin by Category

---

## Power BI Dashboard

A Power BI dashboard was created using the same ecommerce data.

The dashboard includes:

- KPI cards
- Monthly Sales Trend
- Sales by Category
- Profit by Category
- Sales by Region
- Sales by Customer Segment
- Sales by Payment Mode
- Top 10 Products by Sales
- Return Analysis
- Delivery Status Analysis

Slicers were added for:

- Year
- Region
- Category
- Customer Segment

---

## SQL Analysis

SQL Server was used for database creation, relationships,
data validation, KPI analysis, and business queries.

The SQL analysis included:

- Sales and profit analysis
- Order analysis
- Category analysis
- Region analysis
- Customer segment analysis
- Payment mode analysis
- Year-wise analysis
- Product analysis
- Shipping analysis
- Delivery analysis
- Return analysis
- Customer analysis

---

## Project Conclusion

The project combines SQL, Python, and Power BI to perform an end-to-end
ecommerce sales analysis.

The analysis demonstrates skills in data extraction, data validation,
data cleaning, SQL querying, Python analysis, data visualization,
dashboard development, and business insight generation.