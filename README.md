# Zepto-Products-Analysis
A comprehensive SQL analysis project on Zepto product data, focusing on inventory management, pricing strategies, discount trends, and revenue estimation using PostgreSQL.

## Project Overview

This project focuses on analyzing a Zepto product dataset using SQL. The goal is to perform data exploration, inventory analysis, pricing analysis, discount analysis, and revenue estimation to derive meaningful business insights from the data.

The project demonstrates practical SQL skills commonly used by Data Analysts, including data cleaning, aggregation, filtering, grouping, sorting, and business oriented analysis.

---

## Dataset Information

The dataset contains product-level information from Zepto, including:

* Product Category
* Product Name
* MRP (Maximum Retail Price)
* Discount Percentage
* Available Quantity
* Discounted Selling Price
* Product Weight (grams)
* Stock Availability Status
* Quantity

---

## Database Schema

### Table: product

| Column Name            | Description                  |
| ---------------------- | ---------------------------- |
| product_id             | Unique Product ID            |
| category               | Product Category             |
| name                   | Product Name                 |
| mrp                    | Maximum Retail Price         |
| discountPercent        | Discount Percentage          |
| availableQuantity      | Available Inventory          |
| discountedSellingPrice | Selling Price After Discount |
| weightInGms            | Product Weight in Grams      |
| outOfStock             | Stock Availability Status    |
| quantity               | Product Quantity             |

---

## Data Preparation

The following preprocessing steps were performed:

1. Created the product table in PostgreSQL.
2. Imported the dataset using the COPY command.
3. Converted price-related columns from paise to rupees by dividing values by 100.
4. Verified data loading and record structure.

---

## SQL Concepts Used

* SELECT
* WHERE
* ORDER BY
* LIMIT
* Aggregate Functions

  * COUNT()
  * SUM()
  * AVG()
* GROUP BY
* CASE Statement
* Mathematical Calculations
* Data Cleaning
* Business Analysis Queries

---

## Business Questions Solved

### Basic Analysis

1. Display products with MRP greater than ₹1000.
2. Find products currently out of stock.
3. Show the top 10 most expensive products.
4. Count total products in each category.
5. Find average MRP for each category.
6. Display products having discounts greater than 20%.
7. Identify the category with the highest number of products.
8. Calculate total inventory quantity available in each category.
9. Calculate estimated inventory value for each category.

### Advanced Analysis

1. Find the top 10 products with the highest discount percentage.
2. Identify high-MRP products that are out of stock.
3. Calculate estimated revenue for each category.
4. Find products with MRP greater than ₹500 and discount less than 10%.
5. Identify the top 5 categories offering the highest average discount.
6. Calculate price per gram for products weighing more than 100 grams.
7. Categorize products into Low, Medium, and Bulk segments using CASE statements.
8. Calculate total inventory weight for each category.

---

## Key Insights Generated

* Identified premium-priced products in the catalog.
* Analyzed category wise inventory levels.
* Measured category wise revenue potential.
* Compared discount strategies across categories.
* Evaluated product value using price-per-gram analysis.
* Segmented products based on weight categories.
* Monitored stock availability and inventory distribution.

---

## Tools Used

* PostgreSQL
* SQL
* GitHub

---

## Learning Outcomes

Through this project, I strengthened my understanding of:

* Data Cleaning using SQL
* Business-Oriented SQL Analysis
* Inventory and Revenue Analysis
* Aggregate Functions
* Grouping and Categorization
* Writing SQL for real-world business scenarios

---

## Author

Hariom Namdev

Data Analyst 
